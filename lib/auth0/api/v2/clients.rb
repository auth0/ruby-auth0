module Auth0
  module Api
    module V2
      # Methods to use the client endpoints
      module Clients
        attr_reader :clients_path

        # Retrieves a list of all client applications. Accepts a list of fields to include or exclude.
        # @see https://auth0.com/docs/api/management/v2#!/Clients/get_clients
        # @param fields [string|Array] A comma separated list or an array of fields.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @param page [int] Page number to get, 0-based.
        # @param per_page [int] Results per page if also passing a page number.
        # @return [json] Returns the clients applications.
        def clients(fields: nil, include_fields: nil, page: nil, per_page: nil)
          include_fields = true if !fields.nil? && include_fields.nil?
          request_params = {
            fields: fields.is_a?(Array) ? fields.join(',') : fields,
            include_fields: include_fields,
            page: !page.nil? ? page.to_i : nil,
            per_page: !page.nil? && !per_page.nil? ? per_page.to_i : nil
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
          raise Auth0::MissingParameter, 'Must specify a valid client name' if name.to_s.empty?
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
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
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
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          path = "#{clients_path}/#{client_id}"
          delete(path)
        end

        # Updates a client.
        # @see https://auth0.com/docs/api/v2#!/Clients/patch_clients_by_id
        # @param client_id [string] The id of the client to update.
        # @param options [hash] The Hash options used to define the client's properties.
        def patch_client(client_id, options)
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          raise Auth0::MissingParameter, 'Must specify a valid body' if options.to_s.empty?
          path = "#{clients_path}/#{client_id}"
          patch(path, options)
        end

        # Creates credentials for a client
        # @param client_id [string] The Id of the client to update
        # @param options [hash] The payload to send to the endpoint
        def create_client_credentials(client_id, options)
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          raise Auth0::MissingParameter, 'Must specify a valid body' if options.to_s.empty?
          post(client_credentials_path(client_id), options)
        end

        def client_credentials(client_id)
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          get(client_credentials_path(client_id))
        end
        alias get_client_credentials client_credentials

        def client_credential(client_id, credential_id)
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          raise Auth0::MissingParameter, 'Must specify a credential id' if credential_id.to_s.empty?
          get("#{client_credentials_path(client_id)}/#{credential_id}")
        end
        alias get_client_credential client_credential

        def delete_client_credential(client_id, credential_id)
          raise Auth0::MissingClientId, 'Must specify a client id' if client_id.to_s.empty?
          raise Auth0::MissingParameter, 'Must specify a credential id' if credential_id.to_s.empty?

          delete("#{client_credentials_path(client_id)}/#{credential_id}")
        end

        private

        # Clients API path
        def clients_path
          @clients_path ||= '/api/v2/clients'
        end

        def client_credentials_path(client_id)
          "#{clients_path}/#{client_id}/credentials"
        end
      end
    end
  end
end
