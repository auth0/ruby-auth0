module Auth0
  module Api
    # rubocop:disable Metrics/ModuleLength
    module V1
      # {https://auth0.com/docs/api#users}
      module Users
        # {https://auth0.com/docs/api#!#get--api-users}
        #
        # {https://auth0.com/docs/api#!#get--api-users-search--criteria-}
        def users(search = nil)
          path = '/api/users'
          path += "?search=#{search}" unless search.to_s.empty?
          get(path)
        end

        alias users_search users
        alias get_users users

        # {https://auth0.com/docs/api#!#get--api-users--user_id-}
        def user(user_id)
          path = "/api/users/#{user_id}"
          get(path)
        end

        alias get_user user

        # {https://auth0.com/docs/api#!#get--api-users--user_id--devices}
        def user_devices(user_id)
          path = "/api/users/#{user_id}/devices"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-connections--connection--users}
        # {https://auth0.com/docs/api#!#get--api-connections--connection--users-search--criteria-}
        def connection_users(connection_name, search = nil)
          path = "/api/connections/#{connection_name}/users"
          path += "?search=#{search}" unless search.to_s.empty?
          get(path)
        end

        alias search_connection_users connection_users

        # {https://auth0.com/docs/api#!#get--api-enterpriseconnections-users-search--criteria-}
        def enterpriseconnections_users(search_criteria = nil, per_page = 500)
          path = "/api/enterpriseconnections/users?search=#{search_criteria}&per_page=#{per_page.to_i}"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-socialconnections-users-search--criteria-}
        def socialconnections_users(search_criteria = nil, per_page = 500)
          path = "/api/socialconnections/users?search=#{search_criteria}&per_page=#{per_page.to_i}"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-clients--client-id--users}
        def client_users(client_id = @client_id)
          path = "/api/clients/#{client_id}/users"
          get(path)
        end

        # {https://auth0.com/docs/api#!#post--api-users}
        def create_user(email, password, connection_name, request_params = {})
          options = { email: email, password: password, connection: connection_name }
          request_params.merge!(options)
          path = '/api/users'
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--send_verification_email}
        def send_verification_email(user_id)
          path = "/api/users/#{user_id}/send_verification_email"
          post(path)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--change_password_ticket}
        def change_password_ticket(user_id, new_password, result_url = nil)
          request_params = { 'newPassword' => new_password, 'resultUrl' => result_url }
          path = "/api/users/#{user_id}/change_password_ticket"
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--verification_ticket}
        def verification_ticket(user_id, result_url = nil)
          request_params = { 'resultUrl' => result_url }
          path = "/api/users/#{user_id}/verification_ticket"
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#post--api-users--user_id--publickey}
        def create_public_key(user_id, device, public_key)
          path = "/api/users/#{user_id}/public_key"
          request_params = { device: device, public_key: public_key }
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-users--user_id--email}
        def update_user_email(user_id, email, verify = true)
          path = "/api/users/#{user_id}/email"
          request_params = { email: email, verify: verify }
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-users--user_id--metadata}
        # This will overwrite user's metadata, be really carefull, preffer using patch instead
        def update_user_metadata(user_id, metadata = {})
          path = "/api/users/#{user_id}/metadata"
          put(path, metadata)
        end

        # {https://auth0.com/docs/api#!#put--api-users--user_id--password}
        def update_user_password(user_id, password, verify = true)
          path = "/api/users/#{user_id}/password"
          request_params = { password: password, verify: verify }
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-users--email--password}
        def update_user_password_using_email(email, password, connection_name, verify = true)
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
        def patch_user_metadata(user_id, metadata = {})
          path = "/api/users/#{user_id}/metadata"
          patch(path, metadata)
        end

        # {https://auth0.com/docs/api#!#delete--api-users}
        #
        # This will remove all your users
        def delete_users
          path = '/api/users/'
          delete(path)
        end

        # {https://auth0.com/docs/api#!#delete--api-users--user_id-}
        def delete_user(user_id)
          raise Auth0::MissingUserId, 'if you want to remove all users use delete_users method' if user_id.to_s.empty?
          path = "/api/users/#{user_id}"
          delete(path)
        end

        # {https://auth0.com/docs/api#!#delete--api-users--user_id--refresh_tokens--refresh_token-}
        def revoke_user_refresh_token(user_id, refresh_token)
          path = "/api/users/#{user_id}/refresh_tokens/#{refresh_token}"
          delete(path)
        end

        # {https://auth0.com/docs/api#!#delete--api-users--user_id--publickey-device--device-}
        def revoke_user_device_public_key(user_id, device)
          path = "/api/users/#{user_id}/publickey?device=#{device}"
          delete(path)
        end
      end
    end
  end
end
