require 'zache'

class Zache
  def last(key)
    @hash[key]
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
          permission.kind_of? Permission
        end
        permissions.map { |permission| permission.to_h }
      end

      class IdTokenValidator
        def initialize(context)
          @context = context
        end

        def validate(id_token)
          begin
            result = JWT.decode id_token, nil, false, {}
          rescue JWT::DecodeError
            raise Auth0::InvalidIdToken, 'ID token could not be decoded'
          end

          decoded_id_token = { payload: result.first, header: result.last, string: id_token }
          validate_signature decoded_id_token
          validate_claims decoded_id_token
        end

        private

        def validate_signature(decoded_id_token)
          algorithm = @context[:algorithm]
          algorithm_name = algorithm.class.to_s.split('::').last
          options = { algorithms: [algorithm_name], verify_expiration: false, verify_not_before: false }
          secret = nil

          case algorithm
          when Auth0::Algorithm::RS256
            options[:jwks] = JSON.parse(JSON[algorithm.jwks], symbolize_names: true)
          when Auth0::Algorithm::HS256
            secret = algorithm.secret
          end

          begin
            JWT.decode decoded_id_token[:string], secret, true, options
          rescue JWT::VerificationError
            raise Auth0::InvalidIdToken, 'Invalid ID token signature'
          rescue JWT::IncorrectAlgorithm
            alg = decoded_id_token[:header]['alg']
            raise Auth0::InvalidIdToken, "Signature algorithm of \"#{alg}\" is not supported. Expected the ID token to be signed with \"#{algorithm_name}\""
          rescue JWT::DecodeError
            kid = decoded_id_token[:header]['kid']
            raise Auth0::InvalidIdToken, "Could not find a public key for Key ID (kid) \"#{kid}\""
          end
        end

        def validate_claims(decoded_id_token); end
      end

      module Algorithm
        class HS256
          class << self
            private :new

            def secret(secret)
              new secret
            end
          end

          attr_accessor :secret

          def initialize(secret)
            raise Auth0::InvalidParameter, 'Must supply a valid secret' if secret.to_s.empty?

            @secret = secret
          end
        end

        class RS256
          include Auth0::Mixins::HTTPProxy

          @@cache = Zache.new.freeze

          class << self
            private :new

            def jwks_url(url, lifetime: 10 * 60) # 10 minutes
              new url, lifetime
            end
          end

          def initialize(jwks_url, lifetime)
            raise Auth0::InvalidParameter, 'Must supply a valid jwks_url' if jwks_url.to_s.empty?
            raise Auth0::InvalidParameter, 'Must supply a valid lifetime' unless lifetime.is_a?(Integer) && lifetime >= 0

            @lifetime = lifetime
            @jwks_url = jwks_url
          end

          def jwks
            previous_value = @@cache.last(:jwks)[:value] unless @@cache.last(:jwks).nil?

            @@cache.get(:jwks, lifetime: @lifetime, dirty: true) do
              result = get(@jwks_url)
              result.is_a?(Hash) && result.key?('keys') ? result : previous_value
            end
          end
        end
      end
    end
  end
end
