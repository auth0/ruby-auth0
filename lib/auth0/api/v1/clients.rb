module Auth0
  module Api
    module V1
      # {https://auth0.com/docs/api#applications}
      module Clients
        # {https://auth0.com/docs/api#!#get--api-clients}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Clients
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def clients
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/clients'
          get(path)
        end

        alias get_clients clients

        # {https://auth0.com/docs/api#!#post--api-clients}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Clients
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def create_client(name, callbacks = '')
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/clients'
          request_params = {
            name: name,
            callbacks: callbacks
          }
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-clients--client-id-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Clients
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def update_client(name, callbacks = '', client_id = @client_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/clients/#{client_id}"
          request_params = {
            name: name,
            callbacks: callbacks
          }
          put(path, request_params)
        end

        # {https://auth0.com/docs/api#!#patch--api-clients--client-id-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Clients
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def patch_client(name, callbacks = '', client_id = @client_id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
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
