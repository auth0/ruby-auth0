# frozen_string_literal: true

module Auth0
  module Api
    module V2
      # Methods to use the Refresh Token endpoints
      module RefreshTokens
        # Retrieve refresh token information.
        # @see https://auth0.com/docs/api/management/v2/refresh-tokens/get-refresh-token
        # @param id [string] The id of the refresh token to retrieve
        def refresh_token(id)
          raise Auth0::InvalidParameter, 'Must supply a valid id' if id.to_s.empty?

          get "#{resource_path}/#{id}"
        end

        # Delete a refresh token by its ID.
        # @see https://auth0.com/docs/api/management/v2/refresh-tokens/delete-refresh-token
        # @param id [string] The id of the refresh token to delete
        def delete_refresh_token(id)
          raise Auth0::InvalidParameter, 'Must supply a valid id' if id.to_s.empty?

          delete "#{resource_path}/#{id}"
        end

        private

        def resource_path
          @resource_path ||= '/api/v2/refresh-tokens'
        end
      end
    end
  end
end
