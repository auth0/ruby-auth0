module Auth0
  module Api
    module V2
      # Methods to use the resource servers endpoints
      module ResourceServers
        attr_reader :resource_servers_path

        # Retrieves a list of all resource servers.
        # @see https://auth0.com/docs/api/management/v2#!/Resource_servers/get_resource_servers
        # @param page [int] Page number to get, 0-based.
        # @param per_page [int] Results per page if also passing a page number.
        # @return [json] Returns the resource servers.
        def resource_servers(page: nil, per_page: nil)
          request_params = {
            page: !page.nil? ? page.to_i : nil,
            per_page: !page.nil? && !per_page.nil? ? per_page.to_i : nil
          }
          get(resource_servers_path, request_params)
        end
        alias get_resource_servers resource_servers

        # Retrieves a resource server by its ID.
        # @see https://auth0.com/docs/api/management/v2#!/Resource_Servers/get_resource_servers_by_id
        # @param resource_server_id [string] The id of the resource server to retrieve.
        #
        # @return [json] Returns the resource server.
        def resource_server(resource_server_id)
          raise Auth0::InvalidParameter, 'Must supply a valid resource server id' if resource_server_id.to_s.empty?
          path = "#{resource_servers_path}/#{resource_server_id}"
          get(path)
        end

        alias get_resource_server resource_server

        # Creates a new resource server according to the JSON object received in body.
        # @see https://auth0.com/docs/api/management/v2#!/Resource_Servers/post_resource_servers
        # @param identifier [string] The identifier of the resource server.
        # @param options [hash]
        #   * :name [string] The name of the resource server. Must contain at least one character. Does not allow '<' or '>'.
        #   * :signing_alg [string] The algorithm used to sign tokens.
        #   * :signing_secret [string] The secret used to sign tokens when using symmetric algorithms.
        #   * :token_lifetime [integer] The amount of time (in seconds) that the token will be valid after being issued.
        #   * :scopes [array] The scope of the resource server.
        #
        # @return [json] Returns the resource server.
        def create_resource_server(identifier, options = {})
          raise Auth0::InvalidParameter, 'Must supply a valid resource server id' if identifier.to_s.empty?
          if options.fetch(:name, '').index(/[<>]/)
            raise Auth0::InvalidParameter, 'Name must contain at least one character. Does not allow "<" or ">"'
          end
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:identifier] = identifier
          post(resource_servers_path, request_params)
        end

        # Deletes a resource server  by its ID.
        # @see https://auth0.com/docs/api/management/v2#!/Resource_Servers/delete_resource_servers_by_id
        # @param resource_server_id [string] The id of the resource server to delete.
        def delete_resource_server(resource_server_id)
          raise Auth0::InvalidParameter, 'Must supply a valid resource server id' if resource_server_id.to_s.empty?
          path = "#{resource_servers_path}/#{resource_server_id}"
          delete(path)
        end

        # Updates a resource server.
        # @see https://auth0.com/docs/api/management/v2#!/Resource_Servers/patch_resource_servers_by_id
        # @param id [string] The id or audience of the resource server to update.
        # @param body [hash] The Hash options used to define the resource servers's properties.
        def patch_resource_server(id, body)
          raise Auth0::InvalidParameter, 'Must specify a resource server id or audience' if id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a valid body' if body.to_s.empty?
          path = "#{resource_servers_path}/#{id}"
          patch(path, body)
        end
        
        private

        # Resource Servers API path
        def resource_servers_path
          @resource_servers_path ||= '/api/v2/resource-servers'
        end
      end
    end
  end
end
