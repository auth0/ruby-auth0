module Auth0
  module Api
    module V2
      # Methods to use the Tenants endpoints
      module Tenants
        attr_reader :tenant_path

        # Gets tenants settings.
        # @see https://auth0.com/docs/api/v2#!/Tenants/get_settings
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns tenants settings.
        def get_tenant_settings(fields: nil, include_fields: true)
          request_params = {
            fields: fields,
            include_fields: include_fields
          }
          get(tenant_path, request_params)
        end

        # Updates tenants settings.
        # @see https://auth0.com/docs/api/v2#!/Tenants/patch_settings
        # @param body [hash] The Hash body used to define the tenant settings' values.
        #
        # @return [json] Returns the updated tenant settings.
        def update_tenant_settings(body)
          raise Auth0::InvalidParameter, 'Must supply a valid body to update tenant settings' if body.to_s.empty?
          patch(tenant_path, body)
        end

        private

        # Tenants settings API path
        def tenant_path
          @tenant_path ||= '/api/v2/tenants/settings'
        end
      end
    end
  end
end
