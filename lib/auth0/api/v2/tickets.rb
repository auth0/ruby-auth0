module Auth0
  module Api
    module V2
      # https://auth0.com/docs/api/v2#!/Tickets
      module Tickets
        attr_reader :path

        # https://auth0.com/docs/api/v2#!/Tickets/post_email_verification
        def post_email_verification(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to post an email verification' if body.to_s.empty?
          path = '/api/v2/tickets/email-verification'
          post(path, body)
        end

        # https://auth0.com/docs/api/v2#!/Tickets/post_password_change
        def post_password_change(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to post a password-change' if body.to_s.empty?
          path = '/api/v2/tickets/password-change'
          post(path, body)
        end
      end
    end
  end
end
