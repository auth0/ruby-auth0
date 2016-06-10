module Auth0
  module Api
    module V2
      # Methods to use the client endpoints
      module Clients
        attr_reader :clients_path

        # Retrieves a list of all client applications. Accepts a list of fields to include or exclude.
        # @see https://auth0.com/docs/api/v2#!/clients/get_clients
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the clients applications.
        def clients(fields: nil, include_fields: nil)
          include_fields = true if !fields.nil? && include_fields.nil?
          request_params = {
            fields: fields,
            include_fields: include_fields
          }
          get(clients_path, request_params)
        end
        alias get_clients clients

        # Creates a new client application.
        # @see https://auth0.com/docs/api/v2#!/clients/post_clients
        # @param name [string] The name of the client. Must contain at least one character. Does not allow '<' or '>'.
        # @param options [hash] The Hash options used to define the client's properties.
        # @return [json] Returns the created client application.
        def create_client(name, options = {})
          fail Auth0::MissingParameter, 'Must specify a valid client name' if name.to_s.empty?
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:name] = name
          post(clients_path, request_params)
        end

        # Retrieves a client by its id.
        # @see https://auth0.com/docs/api/v2#!/Clients/get_clients_by_id
        # @param client_id [string] The id of the client to retrieve.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @return [json] Returns the requested client application.
        def client(client_id, fields: nil, include_fields: nil)
          fail Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          include_fields = true if !fields.nil? && include_fields.nil?
          request_params = {
            fields: fields,
            include_fields: include_fields
          }
          path = "#{clients_path}/#{client_id}"
          get(path, request_params)
        end

        # Deletes a client and all its related assets (like rules, connections, etc) given its id.
        # @see https://auth0.com/docs/api/v2#!/Clients/delete_clients_by_id
        # @param client_id [string] The id of the client to delete.
        def delete_client(client_id)
          fail Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          path = "#{clients_path}/#{client_id}"
          delete(path)
        end

        # Updates a client.
        # @see https://auth0.com/docs/api/v2#!/Clients/patch_clients_by_id
        # @param client_id [string] The id of the client to update.
        # @param options [hash] The Hash options used to define the client's properties.
        def patch_client(client_id, options)
          fail Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          fail Auth0::MissingParameter, 'Must specify a valid body' if options.to_s.empty?
          path = "#{clients_path}/#{client_id}"
          patch(path, options)
        end

        private

        # Clients API path
        def clients_path
          @clients_path ||= '/api/v2/clients'
        end
      end
    end
  end
end
