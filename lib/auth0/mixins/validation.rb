require 'zache'

class Zache
  def last(key)
    @hash[key][:value] if @hash.key?(key)
  end
end

module Auth0
  module Mixins
    # Module to provide validation for specific data structures.
    module Validation

      # Check a roles array
      def validate_strings_array(strings)
        raise Auth0::InvalidParameter, 'Must supply an array of strings' unless strings.kind_of?(Array)
        raise Auth0::MissingParameter, 'Must supply an array of strings' if strings.empty?
        raise Auth0::InvalidParameter, 'All array elements must be strings' unless strings.all? {|str| str.is_a? String}
      end

      # Check a permissions array
      def validate_permissions_array(permissions)
        raise Auth0::InvalidParameter, 'Must supply an array of Permissions' unless permissions.kind_of?(Array)
        raise Auth0::MissingParameter, 'Must supply an array of Permissions' if permissions.empty?
        raise Auth0::InvalidParameter, 'All array elements must be Permissions' unless permissions.all? do |permission|
          permission.kind_of? ::Auth0::Permission
        end
        permissions.map { |permission| permission.to_h }
      end

      # rubocop:disable Metrics/ClassLength
      class IdTokenValidator
        def initialize(context)
          @context = context
        end

        def validate(id_token)
          decoding_error = 'ID token could not be decoded'

          unless !id_token.to_s.empty? && id_token.split('.').count == 3
            raise Auth0::InvalidIdToken, decoding_error
          end

          begin
            header = JWT::JSON.parse(JWT::Base64.url_decode(id_token.split('.').first))
          rescue
            raise Auth0::InvalidIdToken, decoding_error
          end

          claims = decode_and_validate_signature(id_token, header)
          validate_claims(claims)
        end

        private

        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
        def decode_and_validate_signature(id_token, header)
          algorithm = @context[:algorithm]

          unless algorithm.is_a?(Auth0::Mixins::Validation::JWTAlgorithm)
            raise Auth0::InvalidIdToken, "Signature algorithm of \"#{algorithm}\" is not supported"
          end

          # The expiration verification will be performed in the validate_claims method
          options = { algorithms: [algorithm.name], verify_expiration: false, verify_not_before: false }
          secret = nil

          case algorithm
          when Auth0::Algorithm::RS256
            kid = header['kid']
            jwks = JSON.parse(JSON[algorithm.jwks], symbolize_names: true)

            if !jwks[:keys].find { |key| key[:kid] == kid } && !algorithm.fetched_jwks?
              jwks = JSON.parse(JSON[algorithm.jwks(force: true)], symbolize_names: true)
            end

            options[:jwks] = jwks
          when Auth0::Algorithm::HS256
            secret = algorithm.secret
          end

          begin
            result = JWT.decode(id_token, secret, true, options)
            result.first
          rescue JWT::VerificationError
            raise Auth0::InvalidIdToken, 'Invalid ID token signature'
          rescue JWT::IncorrectAlgorithm
            alg = header['alg']
            raise Auth0::InvalidIdToken, "Signature algorithm of \"#{alg}\" is not supported. Expected the ID token"\
                                         " to be signed with \"#{algorithm.name}\""
          rescue JWT::DecodeError
            raise Auth0::InvalidIdToken, "Could not find a public key for Key ID (kid) \"#{kid}\""
          end
        end

        # rubocop:disable Metrics/PerceivedComplexity
        def validate_claims(claims)
          leeway = @context[:leeway]
          nonce = @context[:nonce]
          issuer = @context[:issuer]
          audience = @context[:audience]
          max_age = @context[:max_age]
          org = @context[:organization]

          raise Auth0::InvalidParameter, 'Must supply a valid leeway' unless leeway.is_a?(Integer) && leeway >= 0
          raise Auth0::InvalidParameter, 'Must supply a valid nonce' unless nonce.nil? || !nonce.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid issuer' unless issuer.nil? || !issuer.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid audience' unless audience.nil? || !audience.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid organization' unless org.nil? || !org.to_s.empty?

          unless max_age.nil? || (max_age.is_a?(Integer) && max_age >= 0)
            raise Auth0::InvalidParameter, 'Must supply a valid max_age'
          end

          validate_iss(claims, issuer)
          validate_sub(claims)
          validate_aud(claims, audience)
          validate_exp(claims, leeway)
          validate_iat(claims, leeway)
          validate_nonce(claims, nonce) if nonce
          validate_azp(claims, audience) if claims['aud'].is_a?(Array) && claims['aud'].count > 1
          validate_auth_time(claims, max_age, leeway) if max_age
          validate_org(claims, org) if org
        end
        # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

        def validate_iss(claims, expected)
          unless claims.key?('iss') && claims['iss'].is_a?(String)
            raise Auth0::InvalidIdToken, 'Issuer (iss) claim must be a string present in the ID token'
          end

          unless expected == claims['iss']
            raise Auth0::InvalidIdToken, "Issuer (iss) claim mismatch in the ID token; expected \"#{expected}\","\
                                         " found \"#{claims['iss']}\""
          end
        end

        def validate_sub(claims)
          unless claims.key?('sub') && claims['sub'].is_a?(String)
            raise Auth0::InvalidIdToken, 'Subject (sub) claim must be a string present in the ID token'
          end
        end

        def validate_aud(claims, expected)
          unless claims.key?('aud') && (claims['aud'].is_a?(String) || claims['aud'].is_a?(Array))
            raise Auth0::InvalidIdToken, 'Audience (aud) claim must be a string or array of strings present'\
                                         ' in the ID token'
          end

          if claims['aud'].is_a?(String) && expected != claims['aud']
            raise Auth0::InvalidIdToken, "Audience (aud) claim mismatch in the ID token; expected \"#{expected}\","\
                                         " found \"#{claims['aud']}\""
          elsif claims['aud'].is_a?(Array) && !claims['aud'].include?(expected)
            raise Auth0::InvalidIdToken, "Audience (aud) claim mismatch in the ID token; expected \"#{expected}\""\
                                         " but was not one of \"#{claims['aud'].join ', '}\""
          end
        end

        def validate_exp(claims, leeway)
          unless claims.key?('exp') && claims['exp'].is_a?(Integer)
            raise Auth0::InvalidIdToken, 'Expiration Time (exp) claim must be a number present in the ID token'
          end

          now = @context[:clock] || Time.now.to_i
          exp_time = claims['exp'] + leeway

          unless now < exp_time
            raise Auth0::InvalidIdToken, 'Expiration Time (exp) claim mismatch in the ID token; current time'\
                                         " \"#{now}\" is after expiration time \"#{exp_time}\""
          end
        end

        def validate_iat(claims, leeway)
          unless claims.key?('iat') && claims['iat'].is_a?(Integer)
            raise Auth0::InvalidIdToken, 'Issued At (iat) claim must be a number present in the ID token'
          end
        end

        def validate_nonce(claims, expected)
          unless claims.key?('nonce') && claims['nonce'].is_a?(String)
            raise Auth0::InvalidIdToken, 'Nonce (nonce) claim must be a string present in the ID token'
          end

          unless expected == claims['nonce']
            raise Auth0::InvalidIdToken, "Nonce (nonce) claim mismatch in the ID token; expected \"#{expected}\","\
                                         " found \"#{claims['nonce']}\""
          end
        end

        def validate_org(claims, expected)
          unless claims.key?('org_id') && claims['org_id'].is_a?(String)
            raise Auth0::InvalidIdToken, 'Organization Id (org_id) claim must be a string present in the ID token'
          end

          unless expected == claims['org_id']
            raise Auth0::InvalidIdToken, "Organization Id (org_id) claim value mismatch in the ID token; expected \"#{expected}\","\
                                         " found \"#{claims['org_id']}\""
          end
        end

        def validate_azp(claims, expected)
          unless claims.key?('azp') && claims['azp'].is_a?(String)
            raise Auth0::InvalidIdToken, 'Authorized Party (azp) claim must be a string present in the ID token'
          end

          unless expected == claims['azp']
            raise Auth0::InvalidIdToken, 'Authorized Party (azp) claim mismatch in the ID token; expected'\
                                         " \"#{expected}\", found \"#{claims['azp']}\""
          end
        end

        def validate_auth_time(claims, max_age, leeway)
          unless claims.key?('auth_time') && claims['auth_time'].is_a?(Integer)
            raise Auth0::InvalidIdToken, 'Authentication Time (auth_time) claim must be a number present in the ID'\
                                         ' token when Max Age (max_age) is specified'
          end

          now = @context[:clock] || Time.now.to_i
          auth_valid_until = claims['auth_time'] + max_age + leeway

          unless now < auth_valid_until
            raise Auth0::InvalidIdToken, 'Authentication Time (auth_time) claim in the ID token indicates that too'\
                                         ' much time has passed since the last end-user authentication. Current time'\
                                         " \"#{now}\" is after last auth at \"#{auth_valid_until}\""
          end
        end
      end
      # rubocop:enable Metrics/ClassLength

      class JWTAlgorithm
        private_class_method :new

        def name
          raise RuntimeError, 'Must be overriden by the subclasses'
        end
      end

      module Algorithm
        # Represents the HS256 algorithm, which rely on shared secrets.
        # @see https://auth0.com/docs/tokens/concepts/signing-algorithms
        class HS256 < JWTAlgorithm
          class << self
            private :new

            # Create a new instance passing the shared secret.
            # @param secret [string] The HMAC shared secret.
            # @return [HS256] A new instance.
            def secret(secret)
              new secret
            end
          end

          attr_accessor :secret

          def initialize(secret)
            raise Auth0::InvalidParameter, 'Must supply a valid secret' if secret.to_s.empty?

            @secret = secret
          end

          # Returns the algorithm name.
          # @return [string] The algorithm name.
          def name
            'HS256'
          end
        end

        # Represents the RS256 algorithm, which rely on public key certificates.
        # @see https://auth0.com/docs/tokens/concepts/signing-algorithms
        class RS256 < JWTAlgorithm
          include Auth0::Mixins::HTTPProxy

          @@cache = Zache.new.freeze

          class << self
            private :new

            # Create a new instance passing the JWK set url.
            # @param url [string] The url where the JWK set is located.
            # @param lifetime [integer] The lifetime of the JWK set in-memory cache in seconds.
            #   Must be a non-negative value. Defaults to *600 seconds* (10 minutes).
            # @return [RS256] A new instance.
            def jwks_url(url, lifetime: 10 * 60)
              new url, lifetime
            end

            # Clear the JWK set cache.
            def remove_jwks
              @@cache.remove(:jwks)
            end
          end

          def initialize(jwks_url, lifetime)
            raise Auth0::InvalidParameter, 'Must supply a valid jwks_url' if jwks_url.to_s.empty?
            raise Auth0::InvalidParameter, 'Must supply a valid lifetime' unless lifetime.is_a?(Integer) && lifetime >= 0

            @lifetime = lifetime
            @jwks_url = jwks_url
            @did_fetch_jwks = false
          end

          # Returns the algorithm name.
          # @return [string] The algorithm name.
          def name
            'RS256'
          end

          # Fetches the JWK set from the in-memory cache or from the url.
          # @return [hash] A JWK set.
          def jwks(force: false)
            result = fetch_jwks if force

            if result
              @@cache.put(:jwks, result, lifetime: @lifetime)
              return result
            end

            previous_value = @@cache.last(:jwks)

            @@cache.get(:jwks, lifetime: @lifetime, dirty: true) do
              new_value = fetch_jwks

              raise Auth0::InvalidIdToken, 'Could not fetch the JWK set' unless new_value || previous_value

              new_value || previous_value
            end
          end

          # Returns whether or not the JWK set was fetched from the url.
          # @return [boolean] +true+ if a request to the JWK set url was made, +false+ otherwise.
          def fetched_jwks?
            @did_fetch_jwks
          end

          private

          def fetch_jwks
            result = get(@jwks_url)
            @did_fetch_jwks = result.is_a?(Hash) && result.key?('keys')
            result if @did_fetch_jwks
          end
        end
      end
    end
  end
end
