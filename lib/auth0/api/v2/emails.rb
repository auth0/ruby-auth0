module Auth0
  module Api
    module V2
      # https://auth0.com/docs/api/v2#!/Emails
      module Emails
        attr_reader :path

        # https://auth0.com/docs/api/v2#!/Emails/get_provider
        def get_provider(options = {})
          request_params = {
            fields:           options.fetch(:fields, nil),
            include_fields:   options.fetch(:include_fields, nil)
          }
          get(path, request_params)
        end

        # https://auth0.com/docs/api/v2#!/Emails/post_provider
        def configure_provider(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to create an email provider' if body.to_s.empty?
          post(path, body)
        end

        # https://auth0.com/docs/api/v2#!/Emails/delete_provider
        def delete_provider
          delete(path)
        end

        # https://auth0.com/docs/api/v2#!/Emails/patch_provider
        def update_provider(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to update an email provider' if body.to_s.empty?
          patch(path, body)
        end

        protected

        def path
          @path ||= '/api/v2/emails/provider'
        end
      end
    end
  end
end
