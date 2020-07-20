module Auth0
  module Api
    module V1
      # {https://auth0.com/docs/api#connections}
      module Connections
        # {https://auth0.com/docs/api#!#get--api-connections}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Connections
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def connections
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          get('/api/connections')
        end
        alias get_connections connections

        # {https://auth0.com/docs/api#!#get--api-connections--connection-name-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Connections
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def connection(connection_name)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/connections/#{connection_name}"
          get(path)
        end
        alias get_connection connection

        # {https://auth0.com/docs/api#!#delete--api-connections--connection-name-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Connections
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def delete_connection(connection_name)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/connections/#{connection_name}"
          delete(path)
        end

        # {https://auth0.com/docs/api#!#post--api-connections}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Connections
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def create_connection(connection_name, strategy, tenant_domain, domain_aliases = nil)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/connections'
          request_params = {
            name: connection_name,
            strategy: strategy,
            options: {
              tenant_domain: tenant_domain,
              domain_aliases: domain_aliases
            }
          }
          post(path, request_params)
        end

        # {https://auth0.com/docs/api#!#put--api-connections--connection-name-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Connections
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def update_connection(connection_name, tenant_domain, status = true)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/connections/#{connection_name}"
          request_params = {
            status: status,
            options: {
              tenant_domain: tenant_domain
            }
          }
          put(path, request_params)
        end
      end
    end
  end
end
