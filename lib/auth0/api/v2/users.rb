require 'auth0/mixins/validation'

module Auth0
  module Api
    module V2
      # Methods to use the users endpoints
      module Users
        include Auth0::Mixins::Validation

        attr_reader :users_path

        # Retrieves a list of Auth0 users.
        # @see https://auth0.com/docs/api/management/v2#!/Users/get_users
        # @param options [hash] The Hash options used to refine the User results.
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer] The page number. Zero based.
        #   * :include_totals [boolean] True if a query summary must be included in the result.
        #   * :sort [string] The field to use for sorting. 1 == ascending and -1 == descending.
        #   * :connection [string] Connection to filter results by.
        #   * :fields [string] A comma separated list of result fields.
        #   * :include_fields [boolean] True to include :fields, false to exclude.
        #   * :q [string] Query in Lucene query string syntax.
        #   * :search_engine [string] User search engine version.
        #     - Will default to v2 if no value is passed.
        #     - Default will change to v3 on 11/13/2018
        #     - See https://auth0.com/docs/users/search/v3#migrate-from-search-engine-v2-to-v3
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
            q:              options.fetch(:q, nil),
            search_engine:  options.fetch(:search_engine, nil)
          }
          get(users_path, request_params)
        end
        alias get_users users

        # Creates a new user according to optional parameters received.
        # The attribute connection is always mandatory but depending on the type of connection you are using there
        # could be others too. For instance, Auth0 DB Connections require email and password.
        # @see https://auth0.com/docs/api/v2#!/Users/post_users
        # @param name [string] The user name.
        # @param options [hash]
        #   * :connection [string] The connection the user belongs to.
        # @return [json] Returns the created user.
        def create_user(name, options = {})
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:name] = name
          post(users_path, request_params)
        end

        # Delete all users - USE WITH CAUTION
        # @see https://auth0.com/docs/api/v2#!/Users/delete_users
        # TODO: Deprecate, no longer provided
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
        # @param body [hash] The optional parameters to update.
        #
        # @return [json] Returns the updated user.
        def patch_user(user_id, body)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty? || body.empty?
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
        # @param options [hash]
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer]  The page number. Zero based.
        #   * :include_totals [boolean] True if a query summary must be included in the result.
        #   * :sort [string] The field to use for sorting. 1 == ascending and -1 == descending.
        #
        # @return [json] Returns the list of existing log entries for the given user_id.
        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        def user_logs(user_id, options = {})
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          path = "#{users_path}/#{user_id}/logs"
          request_params = {
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

        # Get all roles assigned to a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/get_user_roles
        #
        # @param user_id [string] The user_id of the roles to retrieve.
        # @param options [hash]
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer]  The page number. Zero based.
        #   * :include_totals [boolean] True if a query summary must be included in the result.
        #   * :sort [string] The field to use for sorting. 1 == ascending and -1 == descending.
        #
        # @return [json] Returns roles for the given user_id.
        def get_roles(user_id, options = {})
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          path = "#{users_path}/#{user_id}/roles"
          request_params = {
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil)
          }
          get(path, request_params)
        end

        # Remove one or more roles from a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/delete_user_roles
        #
        # @param user_id [string] The user_id of the roles to remove.
        # @param roles [array] An array of role names to remove.
        def remove_roles(user_id, roles)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          validate_roles_array roles
          path = "#{users_path}/#{user_id}/roles"
          delete(path, { roles: roles })
        end

        # Add one or more roles to a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/post_user_roles
        #
        # @param user_id [string] The user_id of the roles to add.
        # @param roles [array] An array of role names to add.
        def add_roles(user_id, roles)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          validate_roles_array roles
          path = "#{users_path}/#{user_id}/roles"
          post(path, { roles: roles })
        end

        # Get all Guardian enrollments for a specific user
        # @see https://auth0.com/docs/api/management/v2#!/Users/get_enrollments
        #
        # @param user_id [string] The user_id of the enrollments to get.
        #
        # @return [json] Returns Guardian enrollments for the given user_id.
        def get_enrollments(user_id)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          get "#{users_path}/#{user_id}/enrollments"
        end

        # Get all permissions for a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/get_permissions
        #
        # @param user_id [string] The user_id of the permissions to get.
        #
        # @return [json] Returns permissions for the given user_id.
        def get_permissions(user_id)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          get "#{users_path}/#{user_id}/permissions"
        end

        # Remove one or more permissions from a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/delete_permissions
        #
        # @param user_id [string] The user_id of the permissions to remove.
        # @param permissions [array] An array of Permission structs to remove.
        def remove_permissions(user_id, permissions)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          permissions = validate_permissions_array permissions
          delete("#{users_path}/#{user_id}/permissions", permissions)
        end

        # Add one or more permissions from a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/post_permissions
        #
        # @param user_id [string] The user_id of the permissions to add.
        # @param permissions [array] An array of Permission structs to add.
        def add_permissions(user_id, permissions)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          permissions = validate_permissions_array permissions
          post("#{users_path}/#{user_id}/permissions", permissions)
        end

        # Remove the current Guardian recovery code and generates and returns a new one.
        # @see https://auth0.com/docs/api/management/v2#!/Users/post_recovery_code_regeneration
        #
        # @param user_id [string] The user_id of the recovery codes to regenerate.
        def generate_recovery_code(user_id)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          post "#{users_path}/#{user_id}/recovery-code-generation"
        end

        # Invalidate all remembered browsers for all authentication factors for a specific user.
        # @see https://auth0.com/docs/api/management/v2#!/Users/post_invalidate_remember_browser
        #
        # @param user_id [string] The user_id of the browsers to invalidate.
        def invalidate_browsers(user_id)
          raise Auth0::MissingUserId, 'Must supply a valid user_id' if user_id.to_s.empty?
          post "#{users_path}/#{user_id}/multifactor/actions/invalidate-remember-browser"
        end

        private

        # Users API path
        def users_path
          @users_path ||= '/api/v2/users'
        end

      end
    end
  end
end
