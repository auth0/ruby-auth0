module Auth0
  module Api
    module V2
      # Methods to use the User Blocks endpoints
      module UserBlocks
        attr_reader :user_blocks_path

        # Retrieves the user blocks
        # @see https://auth0.com/docs/api/management/v2#!/User_Blocks/get_user_blocks
        # @param identifier [string]  Should be any of: username, phone_number, email.
        #
        # @return [json] the user blocks
        def user_blocks(identifier)
          raise Auth0::InvalidParameter, 'Must specify a valid identifier' if identifier.to_s.empty?
          request_params = {
            identifier: identifier
          }
          get(user_blocks_path, request_params)
        end

        # Deletes the user blocks
        # @see https://auth0.com/docs/api/management/v2#!/User_Blocks/delete_user_blocks
        # @param identifier [string]  Should be any of: username, phone_number, email.
        def delete_user_blocks(identifier)
          raise Auth0::InvalidParameter, 'Must specify a valid identifier' if identifier.to_s.empty?
          #path = "#{user_blocks_path}?identifier=#{identifier}"
          request_params = {
            identifier: identifier
          }
          delete(user_blocks_path, request_params)
        end

        # Retrieves a user's blocks
        # @see https://auth0.com/docs/api/management/v2#!/User_Blocks/get_user_blocks_by_id
        # @param user_id [string]  The user_id of the user to retrieve
        #
        # @return [json] the user blocks
        def user_blocks_by_id(user_id)
          raise Auth0::InvalidParameter, 'Must specify a valid identifier' if user_id.to_s.empty?
          path = "#{user_blocks_path}/#{user_id}"
          get(path)
        end

        # Deletes a user's blocks
        # @see https://auth0.com/docs/api/management/v2#!/User_Blocks/delete_user_blocks_by_id
        # @param user_id [string]  The user_id of the user to retrieve
        def delete_user_blocks_by_id(user_id)
          raise Auth0::InvalidParameter, 'Must specify a valid identifier' if user_id.to_s.empty?
          path = "#{user_blocks_path}/#{user_id}"
          delete(path)
        end

        private

        # User Blocks API path
        def user_blocks_path
          @user_blocks_path ||= '/api/v2/user-blocks'
        end
      end
    end
  end
end
