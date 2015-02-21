module Auth0
  module Api
    module V2
      module Clients
        def clients
          get(path)
        end
        alias :get_clients :clients

        def create_client(name, options={})
          request_params = Hash[options.map{|(k,v)| [k.to_sym,v]}]
          request_params[:name] = name
          post(path, request_params)
        end

        def delete_client(client_id)
          path = "/api/v2/clients/" + client_id
          delete(path)
        end

        def patch_client(client_id, options)
          path = "/api/v2/clients/" + client_id
          patch(path, options)
        end

      end
    end
  end
end
