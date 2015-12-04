module Auth0
  module Api
    module V2
      # https://auth0.com/docs/api/v2#!/Emails
      module Emails
        attr_reader :email_path

        # https://auth0.com/docs/api/v2#!/Emails/get_provider
        def get_provider(fields: nil, include_fields: nil)
          request_params = {
            fields:           fields,
            include_fields:   include_fields
          }
          get(email_path, request_params)
        end

        # https://auth0.com/docs/api/v2#!/Emails/post_provider
        def configure_provider(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to create an email provider' if body.to_s.empty?
          post(email_path, body)
        end

        # https://auth0.com/docs/api/v2#!/Emails/delete_provider
        def delete_provider
          delete(email_path)
        end

        # https://auth0.com/docs/api/v2#!/Emails/patch_provider
        def update_provider(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to update an email provider' if body.to_s.empty?
          patch(email_path, body)
        end

        private

        def email_path
          @email_path ||= '/api/v2/emails/provider'
        end
      end
    end
  end
end
