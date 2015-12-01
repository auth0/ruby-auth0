module Auth0
  module Api
    module V2
      # https://auth0.com/docs/apiv2#!/clients
      module Clients
        # https://auth0.com/docs/apiv2#!/clients/get_clients
        def clients(options = {})
          path = '/api/v2/clients'
          get(path, options)
        end
        alias_method :get_clients, :clients

        # https://auth0.com/docs/apiv2#!/clients/post_clients
        def create_client(name, options = {})
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:name] = name
          path = '/api/v2/clients'
          post(path, request_params)
        end

        # https://auth0.com/docs/apiv2#!/clients/get_clients_by_id
        def client(client_id, options = {})
          path = "/api/v2/clients/#{client_id}"
          get(path, options)
        end

        # https://auth0.com/docs/apiv2#!/clients/delete_clients_by_id
        def delete_client(client_id)
          path = "/api/v2/clients/#{client_id}"
          delete(path)
        end

        # https://auth0.com/docs/apiv2#!/clients/patch_clients_by_id
        def patch_client(client_id, options)
          path = "/api/v2/clients/#{client_id}"
          patch(path, options)
        end
      end
    end
  end
end
