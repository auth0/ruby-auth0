module Auth0
  module Api
    module V2
      #https://auth0.com/docs/apiv2#!/users
      module Users
        #https://auth0.com/docs/apiv2#!/users/get_users
        def users( per_page= nil, page = nil, include_totals=nil, sort= nil, connection= nil, fields= nil, q=nil )
          request_params = {
            per_page:       per_page,
            page:           page,
            include_totals: include_totals,
            sort:           sort,
            connection:     connection,
            fields:         fields,
            q:              q
          }

          if request_params[:q]
            request_params[:search_engine] = :v2
          end

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

        # https://auth0.com/docs/apiv2#!/users/get_users_by_id
        def user(user_id, fields=nil)
          path = "/api/v2/users/#{user_id}"
          request_params = {
            fields:         fields,
          }
          get(path, request_params)
        end

        #https://auth0.com/docs/apiv2#!/users/delete_users_by_id
        def delete_user(user_id)
          raise Auth0::MissingUserId, "Must supply a valid user_id" if user_id.nil? or user_id.to_s.empty?
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
