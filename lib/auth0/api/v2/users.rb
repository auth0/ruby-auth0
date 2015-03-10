module Auth0
  module Api
    module V2
      #https://auth0.com/docs/apiv2#!/users
      module Users
        #https://auth0.com/docs/apiv2#!/users/get_users
        def users( per_page: nil, page: nil, include_totals: nil, sort: nil, connection: nil, fields: nil, exclude_fields: nil, q: nil )
          request_params = {  per_page:       per_page,
                              page:           page,
                              include_totals: include_totals,
                              sort:           sort,
                              connection:     connection,
                              fields:         fields,
                              exclude_fields: exclude_fields,
                              q:              q
                            }
          path = "/api/v2/users"
          get(path, request_params)
        end
        alias :get_users :users

        #https://auth0.com/docs/apiv2#!/users/post_users
        def create_user(name, options={})
          path = "/api/v2/users"
          request_params = Hash[options.map{|(k,v)| [k.to_sym,v]}]
          request_params[:name] = name
          post(path, request_params)
        end

        #https://auth0.com/docs/apiv2#!/users/delete_users
        def delete_users
          path = "/api/v2/users"
          delete(path)
        end

        #https://auth0.com/docs/apiv2#!/users/get_users_by_id
        def user(user_id, fields: nil, exclude_fields: nil)
          path = "/api/v2/users/" + user_id.to_s
          request_params = {  fields:         fields,
                              exclude_fields: exclude_fields
                            }
          get(path, request_params)
        end

        #https://auth0.com/docs/apiv2#!/users/delete_users_by_id
        def delete_user(user_id)
          raise Auth0::UserIdIsBlank, "if you want to remove all users user delete_users method" if user_id.to_s.empty?
          path = "/api/v2/users/" + user_id.to_s
          delete(path)
        end


        #https://auth0.com/docs/apiv2#!/users/patch_users_by_id
        def patch_user(user_id, options)
          path = "/api/v2/users/" + user_id
          patch(path, options)
        end

        #https://auth0.com/docs/apiv2#!/users/delete_multifactor_by_provider
        def delete_user_provider(user_id, provider_name)
          path = "/api/v2/users/#{user_id}/multifactor/#{provider_name}"
          delete(path)
        end
      end
    end
  end
end
