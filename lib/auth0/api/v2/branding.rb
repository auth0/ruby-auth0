module Auth0
  module Api
    module V2
      # Methods to use the branding endpoints
      module Branding
        attr_reader :branding_path

        # Retrieve branding settings.
        # @see https://auth0.com/docs/api/management/v2/#!/Branding/get_branding
        #
        # @return [json] Returns branding settings.
        def branding()
          get(branding_path)
        end
        alias get_branding branding

        # Update branding settings.
        # @see https://auth0.com/docs/api/management/v2/#!/Branding/patch_branding
        # @param body [hash] the branding settings to update
        #
        # @return [json] Returns branding settings.
        def patch_branding(body = {})
          patch(branding_path, body)
        end
        alias update_branding patch_branding

        # Get template for New Universal Login Experience
        # @see https://auth0.com/docs/api/management/v2/#!/Branding/get_universal_login
        #
        # @return [json] Returns branding settings.
        def branding_templates_for_universal_login
          get(templates_path)
        end
        alias get_branding_templates_for_universal_login branding_templates_for_universal_login

        # Delete template for New Universal Login Experience
        # @see https://auth0.com/docs/api/management/v2/#!/Branding/delete_universal_login
        # @param rule_id [string] The id of the rule to delete.
        def delete_branding_templates_for_universal_login
          delete(templates_path)
        end

        # Set template for New Universal Login Experience
        # @see https://auth0.com/docs/api/management/v2/#!/Branding/put_universal_login
        # @param body [hash] the branding settings to update
        #
        # @return [json] Returns branding settings.
        def put_branding_templates_for_universal_login(body = {})
          put(templates_path, body)
        end
        alias set_branding_templates_for_universal_login put_branding_templates_for_universal_login

        private

        # Branding API path
        def branding_path
          @branding_path ||= '/api/v2/branding'
        end

        def templates_path
          @templates_path ||= "#{branding_path}/templates/universal-login"
        end
      end
    end
  end
end
