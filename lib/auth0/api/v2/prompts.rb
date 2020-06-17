module Auth0
  module Api
    module V2
      module Prompts
        attr_reader :prompts_path

        # Get prompts settings.
        # @see https://auth0.com/docs/api/management/v2#!/Prompts/get_prompts
        # @return [json] Returns the prompts setting.
        def prompts
          get(prompts_path)
        end
        alias get_prompts prompts

        # Update prompts settings.
        # @see https://auth0.com/docs/api/management/v2#!/Prompts/patch_prompts
        # @param options [hash]
        #   * :universal_login_experience [string] Should be any of: new, classic.
        #
        # @return [json] Returns the prompts settings.
        def patch_prompts(options = {})
          request_params = {
            universal_login_experience: options.fetch(:universal_login_experience, nil)
          }
          patch(prompts_path, request_params)
        end
        alias update_prompts patch_prompts

        # Get custom text for a prompt
        # Retrieve custom text for a specific prompt and language.
        # @see https://auth0.com/docs/api/management/v2#!/Prompts/get_custom_text_by_language
        # @param prompt [string] Prompt of custom texts to update.
        # @param language [string] Language of custom texts to update.
        #
        # @return [json] Returns the custom texts.
        def custom_text(prompt, language)
          raise Auth0::InvalidParameter, 'Must supply a valid prompt' if prompt.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid language' if language.to_s.empty?

          path = "#{prompts_path}/#{prompt}/custom-text/#{language}"
          get(path)
        end
        alias get_custom_text custom_text

        # Set custom text for a specific prompt
        # Existing texts will be overwritten.
        # @see https://auth0.com/docs/api/management/v2#!/Prompts/put_custom_text_by_language
        # @param prompt [string] Prompt of custom texts to update.
        # @param language [string] Language of custom texts to update.
        # @param body [hash] Custom texts.
        #
        # @return [json] Returns the custom texts.
        def put_custom_text(prompt, language, body)
          raise Auth0::InvalidParameter, 'Must supply a valid prompt' if prompt.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid language' if language.to_s.empty?

          path = "#{prompts_path}/#{prompt}/custom-text/#{language}"
          put(path, body)
        end
        alias update_custom_text put_custom_text

        private

        def prompts_path
          @prompts_path ||= '/api/v2/prompts'
        end
      end
    end
  end
end
