module Auth0
  module Api
    module V2
      # https://auth0.com/docs/api/v2#!/Connections
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
          fail Auth0::InvalidParameter, 'Must specify a body to create a connection' if body.to_s.empty?
          path = '/api/v2/connections'
          request_params = body
          post(path, request_params)
        end

        def connection(connection_id, fields: nil, include_fields: true)
          fail Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "/api/v2/connections/#{connection_id}"
          request_params = {
            fields:         fields,
            include_fields: include_fields
          }
          get(path, request_params)
        end

        def delete_connection(connection_id)
          fail Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "/api/v2/connections/#{connection_id}"
          delete(path)
        end

        def delete_connection_user(connection_id, user_email)
          fail Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          fail Auth0::InvalidParameter, 'Must supply a valid user email' if user_email.to_s.empty?
          path = "/api/v2/connections/#{connection_id}/users?email=#{user_email}"
          delete(path)
        end

        def update_connection(connection_id, body)
          fail Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "/api/v2/connections/#{connection_id}"
          patch(path, body)
        end
      end
    end
  end
end
