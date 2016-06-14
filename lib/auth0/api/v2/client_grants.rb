module Auth0
  module Api
    module V2
      # Methods to use the client grants endpoints
      module ClientGrants
        attr_reader :client_grants_path

        # Retrieves a list of all client grants.
        # @see https://auth0.com/docs/api/management/v2#!/client_grants/get_client_grants
        #
        # @return [json] Returns the client grants.
        def client_grants
          get(client_grants_path)
        end
        alias get_all_client_grants client_grants

        # Creates a new client grant.
        # @see https://auth0.com/docs/api/management/v2#!/client_grants/post_client_grants
        # @param options [hash] The Hash options used to define the client grant's properties.
        #
        # @return [json] Returns the created client grant.
        def create_client_grant(options = {})
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          post(client_grants_path, request_params)
        end

        # Deletes a client grant given its id.
        # @see https://auth0.com/docs/api/management/v2#!/client_grants/delete_client_grants_by_id
        # @param client_id [string] The id of the client grant to delete.
        def delete_client_grant(client_grant_id)
          raise Auth0::InvalidParameter, 'Must specify a client grant id' if client_grant_id.to_s.empty?
          path = "#{client_grants_path}/#{client_grant_id}"
          delete(path)
        end

        # Updates a client grant.
        # @see https://auth0.com/docs/api/management/v2#!/client_grants/patch_client_grants_by_id
        # @param client_id [string] The id of the client grant to update.
        # @param options [hash] The Hash options used to define the client grant's properties.
        def patch_client_grant(client_grant_id, options)
          raise Auth0::InvalidParameter, 'Must specify a client grant id' if client_grant_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a valid body' if options.to_s.empty?
          path = "#{client_grants_path}/#{client_grant_id}"
          patch(path, options)
        end
        alias update_client_grant patch_client_grant

        private

        # Client Grants API path
        def client_grants_path
          @client_grants_path ||= '/api/v2/client-grants'
        end
      end
    end
  end
end
