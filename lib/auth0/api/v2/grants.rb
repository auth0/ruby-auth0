module Auth0
  module Api
    module V2
      module Grants
        attr_reader :grants_path

        # Retrieve the grants associated with your account.
        # @see https://auth0.com/docs/api/management/v2#!/Grants/get_grants
        # @param client_id [string] The client_id of the grants to retrieve.
        # @param user_id [string]  The user_id of the grants to retrieve.
        # @param audience [string] The audience of the grants to retrieve.
        # @param page [int] The page index of the results to return. First page is 0.
        # @param per_page [int] The number of results per page. Paging is disabled if parameter not sent.
        # @param include_totals [boolean] Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
        # @return [json] Returns the grants.
        def grants(client_id: nil, user_id: nil, audience: nil, page: nil, per_page: nil, include_totals: nil)
          request_params = {
            client_id: client_id,
            user_id: user_id,
            audience: audience,
            page: page,
            per_page: per_page,
            include_totals: include_totals
          }
          get(grants_path, request_params)
        end
        alias get_all_grants grants

        # Delete a grant associated with your account.
        # @see https://auth0.com/docs/api/management/v2#!/Grants/delete_grants_by_id
        # @param id [string] The id of the grant to delete.
        # @param user_id [string] The user_id of the grant to delete.
        def delete_grant(id, user_id)
          raise Auth0::InvalidParameter, 'Must specify a grant id as id' if id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a user id' if user_id.to_s.empty?
          path = "#{grants_path}/#{id}?user_id=#{user_id}"
          delete(path)
        end

        private

        # Grants API path
        def grants_path
          @grants_path ||= '/api/v2/grants'
        end
      end
    end
  end
end
