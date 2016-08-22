module Auth0
  module Api
    module V2
      # Methods to use the users endpoints
      module Users
        attr_reader :users_path

        # Retrieves a list of existing users.
        # @see https://auth0.com/docs/api/v2#!/Users/get_users
        # @param per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        # @param page [integer]  The page number. Zero based.
        # @param include_totals [boolean] True if a query summary must be included in the result.
        # @param sort [string] The field to use for sorting. 1 == ascending and -1 == descending.
        # @param connection [string] Connection filter.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @param q [string] Query in Lucene query string syntax. Only fields in app_metadata, user_metadata or the
        # normalized user profile are searchable.
        #
        # @return [json] Returns the list of existing users.
        def users(options = {})
          request_params = {
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil),
            sort:           options.fetch(:sort, nil),
            connection:     options.fetch(:connection, nil),
            fields:         options.fetch(:fields, nil),
            include_fields: options.fetch(:include_fields, nil),
            q:              options.fetch(:q, nil)
          }
          request_params[:search_engine] = :v2 if request_params[:q]
          get(users_path, request_params)
        end
        alias get_users users

        # Creates a new user according to optional parameters received.
        # The attribute connection is always mandatory but depending on the type of connection you are using there
        # could be others too. For instance, Auth0 DB Connections require email and password.
        # @see https://auth0.com/docs/api/v2#!/Users/post_users
        # @param name [string] The user name.
        # @param connection [string] The connection the user belongs to.
        #
        # @return [json] Returns the created user.
        def create_user(name, options = {})
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:name] = name
          post(users_path, request_params)
        end

        # Delete all users - USE WITH CAUTION
        # @see https://auth0.com/docs/api/v2#!/Users/delete_users
        def delete_users
          delete(users_path)
        end

        # Retrieves a user given a user_id
        # @see https://auth0.com/docs/api/v2#!/Users/get_users_by_id
        # @param user_id [string] The user_id of the user to retrieve.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the user with the given user_id if it exists.
        def user(user_id, fields: nil, include_fields: true)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          path = "#{users_path}/#{user_id}"
          request_params = {
            fields:         fields,
            include_fields: include_fields
          }
          get(path, request_params)
        end

        # Deletes a single user given its id
        # @see https://auth0.com/docs/api/v2#!/Users/delete_users_by_id
        # @param user_id [string] The user_id of the user to delete.
        def delete_user(user_id)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          path = "#{users_path}/#{user_id}"
          delete(path)
        end

        # Updates a user with the object's properties received in the optional parameters.
        # These are the attributes that can be updated at the root level:
        # blocked, email_verified, email, verify_email, password, phone_number, phone_verified,
        # verify_password, user_metadata, app_metadata, username
        # Some considerations:
        # The properties of the new object will replace the old ones.
        # The metadata fields are an exception to this rule (user_metadata and app_metadata). These properties are
        # merged instead of being replaced but be careful, the merge only occurs on the first level.
        # If you are updating email_verified, phone_verified, username or password you need to specify the connection
        # property too.
        # If your are updating email or phone_number you need to specify the connection and the client_id properties.
        # @see https://auth0.com/docs/api/v2#!/Users/patch_users_by_id
        # @param user_id [string] The user_id of the user to update.
        # @param body [hash] The optional parametes to update.
        #
        # @return [json] Returns the updated user.
        def patch_user(user_id, body)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?
          path = "#{users_path}/#{user_id}"
          patch(path, body)
        end
        alias update_user patch_user

        # Delete a user's multifactor provider
        # @see https://auth0.com/docs/api/v2#!/Users/delete_multifactor_by_provider
        # @param user_id [string] The user_id of the user to delete the multifactor provider from.
        # @param provider_name [string] The multifactor provider. Supported values 'duo' or 'google-authenticator'.
        def delete_user_provider(user_id, provider_name)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid provider name' if provider_name.to_s.empty?
          path = "#{users_path}/#{user_id}/multifactor/#{provider_name}"
          delete(path)
        end

        # Links the account specified in the body (secondary account) to the account specified by the id param
        # of the URL (primary account).
        # 1. With the authenticated primary account's JWT in the Authorization header, which has the
        # update:current_user_identities scope. In this case only the link_with param is required in the body,
        # containing the JWT obtained upon the secondary account's authentication.
        # 2. With an API V2 generated token with update:users scope. In this case you need to send provider and user_id
        # in the body. Optionally you can also send the connection_id param which is suitable for identifying a
        # particular database connection for the 'auth0' provider.
        # @see https://auth0.com/docs/api/v2#!/Users/post_identities
        # @param user_id [string] The user_id of the primary identity where you are linking the secondary account to.
        # @param body [string] the options to link the account to.
        #
        # @return [json] Returns the new array of the primary account identities.
        def link_user_account(user_id, body)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?
          path = "#{users_path}/#{user_id}/identities"
          post(path, body)
        end

        # Unlink a user account
        # @see https://auth0.com/docs/api/v2#!/Users/delete_provider_by_user_id
        # @param user_id [string] The user_id of the user identity.
        # @param provider [string] The type of identity provider.
        # @param secondary_user_id [string] The unique identifier for the user for the identity.
        #
        # @return [json] Returns the array of the unlinked account identities.
        def unlink_users_account(user_id, provider, secondary_user_id)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          raise Auth0::MissingUserId, 'Must supply a valid secondary user_id' if secondary_user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid provider' if provider.to_s.empty?
          path = "#{users_path}/#{user_id}/identities/#{provider}/#{secondary_user_id}"
          delete(path)
        end

        # Retrieve every log event for a specific user id
        # @see https://auth0.com/docs/api/management/v2#!/Users/get_logs_by_user
        # @param user_id [string] The user_id of the logs to retrieve.
        # @param per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        # @param page [integer]  The page number. Zero based.
        # @param include_totals [boolean] True if a query summary must be included in the result.
        # @param sort [string] The field to use for sorting. 1 == ascending and -1 == descending.
        #
        # @return [json] Returns the list of existing log entries for the given user_id.
        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        def user_logs(user_id, options = {})
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          path = "#{users_path}/#{user_id}/logs"
          request_params = {
            user_id:        user_id,
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil),
            sort:           options.fetch(:sort, nil)
          }
          if request_params[:per_page].to_i > 100
            raise Auth0::InvalidParameter, 'The total amount of entries per page should be less than 100'
          end
          sort_pattern = /^(([a-zA-Z0-9_\.]+))\:(1|-1)$/
          if !request_params[:sort].nil? && !sort_pattern.match(request_params[:sort])
            raise Auth0::InvalidParameter, 'Sort does not match pattern ^(([a-zA-Z0-9_\\.]+))\\:(1|-1)$'
          end
          get(path, request_params)
        end
        alias get_user_log_events user_logs

        private

        # Users API path
        def users_path
          @users_path ||= '/api/v2/users'
        end
      end
    end
  end
end
