module Auth0
  module Api
    module V2
      module Connections
        def connections(strategy: nil, fields: nil, include_fields: true)
          request_params = {
            strategy: strategy,
            fields: fields,
            include_fields: include_fields
          }
          path = '/api/v2/connections'
          get(path, request_params)
        end
        alias_method :get_connections, :connections

        def create_connection(body)
          path = '/api/v2/connections'
          request_params = body
          post(path, request_params)
        end

        def connection(connection_id, fields: nil, include_fields: true)
          path = '/api/v2/connections/' + connection_id.to_s
          request_params = {
            fields:         fields,
            include_fields: include_fields
          }
          get(path, request_params)
        end

        def delete_connection(connection_id)
          fail Auth0::MissingConnectionId, 'you must specify a connection id' if connection_id.to_s.empty?
          path = "/api/v2/connections/#{connection_id}"
          delete(path)
        end

        def update_connection(connection_id, body)
          fail Auth0::MissingConnectionId, 'you must specify a connection id' if connection_id.to_s.empty?
          path = '/api/v2/connections/' + connection_id.to_s
          patch(path, body)
        end
      end
    end
  end
end
