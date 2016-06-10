module Auth0
  module Api
    module V2
      # Methods to use the connections endpoints
      module Emails
        attr_reader :email_path

        # Get all the email providers.
        # @see https://auth0.com/docs/api/v2#!/Emails/get_provider
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the existing email providers.
        def get_provider(fields: nil, include_fields: nil)
          request_params = {
            fields:           fields,
            include_fields:   include_fields
          }
          get(email_path, request_params)
        end

        # Configure a new email provider.
        # @see https://auth0.com/docs/api/v2#!/Emails/post_provider
        # @param body [hash] The Hash options used to specify the email provider's properties.
        def configure_provider(body)
          fail Auth0::InvalidParameter, 'Must supply a valid body to create an email provider' if body.to_s.empty?
          post(email_path, body)
        end

        # Deletes the configured email provider.
        # @see https://auth0.com/docs/api/v2#!/Emails/delete_provider
        #
        # @return [json] Returns the created email provider.
        def delete_provider
          delete(email_path)
        end

        # Updates the configured email provider.
        # @see https://auth0.com/docs/api/v2#!/Emails/patch_provider
        # @param body [hash] The Hash options used to specify the email provider's properties.
        #
        # @return [json] Returns the updated email provider.
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
