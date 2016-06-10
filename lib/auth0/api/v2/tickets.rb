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
        #
        # @return [json] Returns the created ticket url.
        def post_email_verification(user_id, result_url: nil)
          if user_id.to_s.empty?
            fail Auth0::InvalidParameter, 'Must supply a valid user id to post an email verification'
          end
          path = "#{tickets_path}/email-verification"
          request_params = {
            user_id: user_id,
            result_url: result_url
          }
          post(path, request_params)
        end

        # Create a password change ticket
        # @see https://auth0.com/docs/api/v2#!/Tickets/post_password_change
        # @param new_password [string] The password to be set for the user once the ticket is used.
        # @param user_id [string] The user_id of for which the ticket is to be created.
        # @param result_url [string] The user will be redirected to this endpoint once the ticket is used.
        # @param connection_id [string] The connection that provides the identity for which the password is to be
        # changed. If sending this parameter, the email is also required and the user_id is invalid.
        # @param email [string] The user's email.
        #
        # @return [json] Returns the created ticket url.
        def post_password_change(new_password, user_id: nil, result_url: nil, connection_id: nil, email: nil)
          if new_password.to_s.empty?
            fail Auth0::InvalidParameter, 'Must supply a valid new password to post a password-change'
          end
          path = "#{tickets_path}/password-change"
          request_params = {
            user_id: user_id,
            result_url: result_url,
            new_password: new_password,
            connection_id: connection_id,
            email: email
          }
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
