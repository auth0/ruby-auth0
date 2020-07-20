module Auth0
  module Api
    # rubocop:disable Metrics/ModuleLength
    module V1
      # {https://auth0.com/docs/api#users}
      module Users
        # {https://auth0.com/docs/api#!#get--api-users}
        #
        # {https://auth0.com/docs/api#!#get--api-users-search--criteria-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def users(search = nil)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/users'
          path += "?search=#{search}" unless search.to_s.empty?
          get(path)
        end

        alias users_search users
        alias get_users users

        # {https://auth0.com/docs/api#!#get--api-users--user_id-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def user(user_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}"
          get(path)
        end

        alias get_user user

        # {https://auth0.com/docs/api#!#get--api-users--user_id--devices}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def user_devices(user_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/devices"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-connections--connection--users}
        # {https://auth0.com/docs/api#!#get--api-connections--connection--users-search--criteria-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def connection_users(connection_name, search = nil)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/connections/#{connection_name}/users"
          path += "?search=#{search}" unless search.to_s.empty?
          get(path)
        end

        alias search_connection_users connection_users

        # {https://auth0.com/docs/api#!#get--api-enterpriseconnections-users-search--criteria-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def enterpriseconnections_users(search_criteria = nil, per_page = 500)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/enterpriseconnections/users?search=#{search_criteria}&per_page=#{per_page.to_i}"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-socialconnections-users-search--criteria-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def socialconnections_users(search_criteria = nil, per_page = 500)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/socialconnections/users?search=#{search_criteria}&per_page=#{per_page.to_i}"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-clients--client-id--users}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def client_users(client_id = @client_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/clients/#{client_id}/users"
          get(path)
        end

        # {https://auth0.com/docs/api#!#post--api-users}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def create_user(email, password, connection_name, request_params = {})
        warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          options = { email: email, password: password, connection: connection_name }
          request_params.merge!(options)
          path = '/api/users'
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--send_verification_email}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def send_verification_email(user_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/send_verification_email"
          post(path)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--change_password_ticket}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def change_password_ticket(user_id, new_password, result_url = nil)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          request_params = { 'newPassword' => new_password, 'resultUrl' => result_url }
          path = "/api/users/#{user_id}/change_password_ticket"
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--verification_ticket}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def verification_ticket(user_id, result_url = nil)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          request_params = { 'resultUrl' => result_url }
          path = "/api/users/#{user_id}/verification_ticket"
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--publickey}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def create_public_key(user_id, device, public_key)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/public_key"
          request_params = { device: device, public_key: public_key }
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-users--user_id--email}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def update_user_email(user_id, email, verify = true)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/email"
          request_params = { email: email, verify: verify }
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-users--user_id--metadata}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        # This will overwrite user's metadata, be really carefull, preffer using patch instead
        def update_user_metadata(user_id, metadata = {})
        warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/metadata"
          put(path, metadata)
        end

        # {https://auth0.com/docs/api#!#put--api-users--user_id--password}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def update_user_password(user_id, password, verify = true)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/password"
          request_params = { password: password, verify: verify }
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-users--email--password}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def update_user_password_using_email(email, password, connection_name, verify = true)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          request_params = {
            email:      email,
            password:   password,
            connection: connection_name,
            verify:     verify
          }
          path = "/api/users/#{email}/password"
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#patch--api-users--user_id--metadata}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def patch_user_metadata(user_id, metadata = {})
        warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/metadata"
          patch(path, metadata)
        end

        # {https://auth0.com/docs/api#!#delete--api-users}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        #
        # This will remove all your users
        def delete_users
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/users/'
          delete(path)
        end

        # {https://auth0.com/docs/api#!#delete--api-users--user_id-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def delete_user(user_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          raise Auth0::MissingUserId, 'if you want to remove all users use delete_users method' if user_id.to_s.empty?
          path = "/api/users/#{user_id}"
          delete(path)
        end

        # {https://auth0.com/docs/api#!#delete--api-users--user_id--refresh_tokens--refresh_token-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def revoke_user_refresh_token(user_id, refresh_token)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/refresh_tokens/#{refresh_token}"
          delete(path)
        end

        # {https://auth0.com/docs/api#!#delete--api-users--user_id--publickey-device--device-}
        # @deprecated - 4.14.0, API v1 is no longer in use, please use Auth0::Api::V2::Users
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def revoke_user_device_public_key(user_id, device)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/publickey?device=#{device}"
          delete(path)
        end
      end
    end
  end
end
