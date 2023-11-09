module Auth0
  module Api
    module V2
      # Methods to use the client grants endpoints
      module ClientGrants
        attr_reader :client_grants_path

        # Retrieves a list of all client grants.
        # @see https://auth0.com/docs/api/management/v2#!/client_grants/get_client_grants
        # @param client_id [string] The client_id of the client grant to retrieve.
        # @param audience [string] The audience of the client grant to retrieve.
        # @param page [int] Page number to get, 0-based.
        # @param per_page [int] Results per page if also passing a page number.
        # @param allow_any_organization [bool] Optional filter on allow_any_organization.
        # @return [json] Returns the client grants.
        def client_grants (client_id: nil, audience: nil, page: nil, per_page: nil, allow_any_organization: nil)
          request_params = {
            client_id: client_id,
            audience: audience,
            page: page,
            per_page: per_page,
            allow_any_organization: allow_any_organization
          }
          get(client_grants_path, request_params)
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
        # @param client_grant_id [string] The id of the client grant to delete.
        def delete_client_grant(client_grant_id)
          raise Auth0::InvalidParameter, 'Must specify a client grant id' if client_grant_id.to_s.empty?
          path = "#{client_grants_path}/#{client_grant_id}"
          delete(path)
        end

        # Updates a client grant.
        # @see https://auth0.com/docs/api/management/v2#!/client_grants/patch_client_grants_by_id
        # @param client_grant_id [string] The id of the client grant to update.
        # @param options [hash] The Hash options used to define the client grant's properties.
        def patch_client_grant(client_grant_id, options)
          raise Auth0::InvalidParameter, 'Must specify a client grant id' if client_grant_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a valid body' if options.to_s.empty?
          path = "#{client_grants_path}/#{client_grant_id}"
          patch(path, options)
        end
        alias update_client_grant patch_client_grant


        # Get the organizations associated to a client grant.
        # @param id [string] The client_grant_id of the client grant.
        # @param options [hash] The Hash options used to define the paging of results
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer] The page number. Zero based.
        #   * :from [string] For checkpoint pagination, the ID from which to start selection from.
        #   * :take [integer] For checkpoint pagination, the number of entries to retrieve. Default is 50.
        #   * :include_totals [boolean] True to include query summary in the result, false or nil otherwise.
        # @return [json] Returns the organizations.
        def get_client_grants_organizations(client_grant_id, options = {})
          raise Auth0::InvalidParameter, 'Must specify a client grant id' if client_grant_id.to_s.empty?
          request_params = {
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            from:           options.fetch(:from, nil),
            take:           options.fetch(:take, nil),
            include_totals: options.fetch(:include_totals, nil)
          }
          path = "#{client_grants_path}/#{client_grant_id}/organizations"
          get(path, request_params)
        end

        private

        # Client Grants API path
        def client_grants_path
          @client_grants_path ||= '/api/v2/client-grants'
        end
      end
    end
  end
end
