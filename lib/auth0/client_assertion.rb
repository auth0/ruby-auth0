# frozen_string_literal: true

require 'jwt'

module Auth0
  module ClientAssertion
    CLIENT_ASSERTION_TYPE = 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer'.freeze

    # Adds keys into the supplied hash for either the client secret, or client assertion. If `client_assertion_signing_key` is not nil,
    # it takes precedence over `client_secret`.
    # @param [hash] The hash to add the keys to
    # @param client_id [string] The client ID
    # @param client_secret [string] The client secret
    # @param client_assertion_signing_key [PKey] The key used to sign the client assertion JWT
    # @param client_assertion_signing_alg [string] The algorithm used when signing the client assertion JWT
    def populate_client_assertion_or_secret(hash, 
      domain: @domain,
      client_id: @client_id, 
      client_secret: @client_secret,
      client_assertion_signing_key: @client_assertion_signing_key,
      client_assertion_signing_alg: @client_assertion_signing_alg)

      if !client_assertion_signing_key.nil?
        # Create JWT
        now = Time.now.to_i

        payload = {
          iss: client_id,
          sub: client_id,
          aud: "https://#{domain}/",
          iat: now,
          exp: now + 180,
          jti: SecureRandom.uuid
        }

        jwt = JWT.encode payload, client_assertion_signing_key, client_assertion_signing_alg

        hash[:client_assertion] = jwt
        hash[:client_assertion_type] = Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      else
        hash[:client_secret] = client_secret
      end
    end
  end
end