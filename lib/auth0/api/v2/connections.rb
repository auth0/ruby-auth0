module Auth0
  module Api
    module V2
      # Methods to use the connections endpoints
      module Connections
        attr_reader :connections_path

        # Retrieves every connection matching the specified strategy. All connections are retrieved if no strategy is
        # being specified. Accepts a list of fields to include or exclude in the resulting list of connection objects.
        # @see https://auth0.com/docs/api/management/v2#!/Connections/get_connections
        # @param strategy [string] Strategy to filter connection results.
        # @param name [string] Name to filter connection results.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @param page [int] Page number to get, 0-based.
        # @param per_page [int] Results per page if also passing a page number.
        # @return [json] Returns the existing connections matching the strategy.
        def connections(
          strategy: nil,
          name: nil,
          fields: nil,
          include_fields: nil,
          page: nil,
          per_page: nil
        )
          include_fields = true if !fields.nil? && include_fields.nil?
          request_params = {
            strategy: strategy,
            name: name,
            fields: fields.is_a?(Array) ? fields.join(',') : fields,
            include_fields: include_fields,
            page: !page.nil? ? page.to_i : nil,
            per_page: !page.nil? && !per_page.nil? ? per_page.to_i : nil
          }
          get(connections_path, request_params)
        end
        alias get_connections connections

        # Creates a new connection according to the JSON object received in body.
        # @see https://auth0.com/docs/api/v2#!/Connections/post_connections
        # @param body [hash] The Hash options used to define the conecctions's properties.
        #
        # @return [json] Returns the created connection.
        def create_connection(body)
          raise Auth0::InvalidParameter, 'Must specify a body to create a connection' if body.to_s.empty?
          request_params = body
          post(connections_path, request_params)
        end

        # Retrieves a connection by its id.
        # @see https://auth0.com/docs/api/v2#!/Connections/get_connections_by_id
        # @param connection_id [string] The id of the connection to retrieve.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the matching connection.
        def connection(connection_id, fields: nil, include_fields: true)
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "#{connections_path}/#{connection_id}"
          request_params = {
            fields:         fields,
            include_fields: include_fields
          }
          get(path, request_params)
        end

        # Deletes a connection and all its users.
        # @see https://auth0.com/docs/api/v2#!/Connections/delete_connections_by_id
        # @param connection_id [string] The id of the connection to delete.
        def delete_connection(connection_id)
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "#{connections_path}/#{connection_id}"
          delete(path)
        end

        # Deletes a specified connection user by its email (currently only database connections are supported and you
        # cannot delete all users from specific connection).
        # @see https://auth0.com/docs/api/v2#!/Connections/delete_users
        # @param connection_id [string] The id of the connection.
        # @param user_email [string] The email of the user to delete.
        def delete_connection_user(connection_id, user_email)
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid user email' if user_email.to_s.empty?
          path = "#{connections_path}/#{connection_id}/users"
          request_params = {
            email: user_email
          }
          delete(path, request_params)
        end

        # Updates a connection. Updates the fields specified in the body parameter.
        # @see https://auth0.com/docs/api/v2#!/Connections/patch_connections_by_id
        # @param connection_id [string] The id of the connection to delete.
        # @param body [hash] The Hash options used to update the conecctions's properties.
        #
        # @return [json] Returns the updated connection.
        def update_connection(connection_id, body)
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "#{connections_path}/#{connection_id}"
          patch(path, body)
        end

        private

        # Connections API path
        def connections_path
          @connections_path ||= '/api/v2/connections'
        end
      end
    end
  end
end
