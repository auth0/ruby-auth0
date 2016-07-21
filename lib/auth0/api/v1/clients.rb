module Auth0
  module Api
    module V1
      # {https://auth0.com/docs/api#applications}
      module Clients
        # {https://auth0.com/docs/api#!#get--api-clients}
        def clients
          path = '/api/clients'
          get(path)
        end

        alias get_clients clients

        # {https://auth0.com/docs/api#!#post--api-clients}
        def create_client(name, callbacks = '')
          path = '/api/clients'
          request_params = {
            name: name,
            callbacks: callbacks
          }
          post(path, request_params)
        end

        # @deprecated use {#patch_client}
        # {https://auth0.com/docs/api#!#put--api-clients--client-id-}
        def update_client(name, callbacks = '', client_id = @client_id)
          warn 'This endpoint has been deprecated in favor of PATCH.'
          path = "/api/clients/#{client_id}"
          request_params = {
            name: name,
            callbacks: callbacks
          }
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#patch--api-clients--client-id-}
        def patch_client(name, callbacks = '', client_id = @client_id)
          path = "/api/clients/#{client_id}"
          request_params = {
            name: name,
            callbacks: callbacks
          }
          patch(path, request_params)
        end
      end
    end
  end
end
