module Auth0
  module Api
    module V2
      # Methods to use the tickets endpoints
      module Tickets
        attr_reader :tickets_path

        # Create an email verification ticket
        # @see https://auth0.com/docs/api/v2#!/Tickets/post_email_verification
        # @param user_id [string] The user_id of for which the ticket is to be created.
        # @param result_url [string] The user will be redirected to this endpoint once the ticket is used.
        # @param ttl_sec [integer] The ticket's lifetime in seconds starting from the moment of creation.
        # After expiration, the ticket cannot be used to verify the user's email. If not specified or if
        # you send 0, the Auth0 default lifetime of five days will be applied
        # @param identity [hash] Used to verify secondary, federated, and passwordless-email identities.
        #   * :user_id [string] user_id of the identity.
        #   * :provider [string] provider of the identity.
        # @param client_id [string] client id
        # @param organization_id [string] organization id
        #
        # @return [json] Returns the created ticket url.
        def post_email_verification(user_id, result_url: nil, ttl_sec: nil, identity: nil, client_id: nil, organization_id: nil)
          if user_id.to_s.empty?
            raise Auth0::InvalidParameter, 'Must supply a valid user id to post an email verification'
          end
          path = "#{tickets_path}/email-verification"
          request_params = {
            user_id: user_id,
            result_url: result_url,
            ttl_sec: ttl_sec.is_a?(Integer) ? ttl_sec : nil
          }
          request_params[:client_id] = client_id unless client_id.nil?
          request_params[:organization_id] = organization_id unless organization_id.nil?

          if identity
            unless identity.is_a? Hash
              raise Auth0::InvalidParameter, 'Identity must be a hash to post an email verification'
            end
            request_params[:identity] = identity
          end

          post(path, request_params)
        end

        # Create a password change ticket
        # @see https://auth0.com/docs/api/v2#!/Tickets/post_password_change
        # @param result_url [string] The user will be redirected to this endpoint once the ticket is used.
        # @param user_id [string] The user_id of for which the ticket is to be created.
        # @param connection_id [string] The connection that provides the identity for which the password is to be
        # changed. If sending this parameter, the email is also required and the user_id is invalid.
        # @param email [string] The user's email.
        # @param ttl_sec [integer] The ticket's lifetime in seconds starting from the moment of creation. After
        # expiration, the ticket cannot be used to change the user's password. If not specified or if you send 0,
        # the Auth0 default lifetime of 5 days will be applied.
        # @param mark_email_as_verified [boolean] true if email_verified attribute must be set to true once password is
        # changed, false if email_verified attribute should not be updated
        # @param includeEmailInRedirect [boolean] Whether or not we include the email as part of the returnUrl
        # in the reset_email
        # @param new_password [string] The password to be set for the user once the ticket is used.
        # @param client_id [string] client id
        # @param organization_id [string] organization id
        #
        # @return [json] Returns the created ticket url.
        def post_password_change(
            result_url: nil,
            user_id: nil,
            connection_id: nil,
            email: nil,
            ttl_sec: nil,
            mark_email_as_verified: nil,
            includeEmailInRedirect: nil,
            new_password: nil,
            client_id: nil,
            organization_id: nil
          )

          booleans = [true, false]
          path = "#{tickets_path}/password-change"
          request_params = {
            result_url: result_url,
            user_id: user_id,
            connection_id: connection_id,
            email: email,
            ttl_sec: ttl_sec.is_a?(Integer) ? ttl_sec : nil,
            mark_email_as_verified: booleans.include?(mark_email_as_verified) ? mark_email_as_verified : nil,
            includeEmailInRedirect: booleans.include?(includeEmailInRedirect) ? includeEmailInRedirect : nil,
            new_password: new_password
          }
          request_params[:client_id] = client_id unless client_id.nil?
          request_params[:organization_id] = organization_id unless organization_id.nil?

          post(path, request_params)
        end

        private

        # Tickets API path
        def tickets_path
          @tickets_path ||= '/api/v2/tickets'
        end
      end
    end
  end
end
