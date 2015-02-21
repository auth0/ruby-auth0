module Auth0
  module Api
    module V2
      module Users
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
          get(path, request_params)
        end
        alias :get_users :users

        def create_user(name, options={})
          request_params = Hash[options.map{|(k,v)| [k.to_sym,v]}]
          request_params[:name] = name
          post(path, request_params)
        end

        def delete_user(user_id)
          if  user_id.to_s.empty?
            raise Auth0::InvaliParameter, "Id is empty, you're going to remove all users?"
          end
          path = "/api/v2/users/" + user_id.to_s
          delete(path)
        end

        def user(user_id, fields: nil, exclude_fields: nil)
          path = "/api/v2/users/" + user_id.to_s
          request_params = {  fields:         fields,
                              exclude_fields: exclude_fields
                            }
          get(path, request_params)
        end


        def delete_users
          delete(path)
        end

        def patch_user(user_id, options)
          path = "/api/v2/users/" + user_id
          patch(path, options)
        end

        def delete_user_provider(user_id, provider_name)
          path = "/api/v2/users/#{id}/multifactor/#{provider}"
          delete(path)
        end
      end
    end
  end
end
