module Auth0
  module Api
    module V2
      # Methods to use the Roles endpoints
      module Roles
        include Auth0::Mixins::Validation

        # Get all Roles
        # Required scope: "read:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/get_roles
        #
        # @param options [hash] A hash of options for getting Roles
        #   - per_page: Number of Roles to return.
        #   - page: Page number to return, zero-based.
        #   - include_totals: True to include query summary in the result, false or nil otherwise.
        #   - name_filter: Optional filter on name (case-insensitive).
        #
        # @return [json] All Roles matching the query.
        def get_roles(options = {})
          request_params = {
            per_page: options.fetch(:per_page, nil),
            page: options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil),
            name_filter: options.fetch(:name_filter, nil)
          }
          get roles_path, request_params
        end
        alias roles get_roles

        # Get a single Role by ID.
        # Required scope: "read:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/get_roles_by_id
        #
        # @param role_id [string] Role ID to get.
        #
        # @return [json] Role data.
        def get_role(role_id)
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          get "#{roles_path}/#{role_id}"
        end
        alias role get_role

        # Create a new Role.
        # Required scope: "create:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/post_roles
        #
        # @param role_name [string] Role name for the new Role.
        # @param data [hash] Additional Role data.
        def create_role(role_name, data = {})
          raise Auth0::MissingParameter, 'Must supply a valid role_name' if role_name.to_s.empty?

          data[:name] = role_name
          post roles_path.to_s, data
        end

        # Update a Role by ID.
        # Required scope: "update:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/patch_roles_by_id
        #
        # @param role_id [string] Role ID to update.
        # @param data [string] Role data to update.
        def update_role(role_id, data = {})
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          patch "#{roles_path}/#{role_id}", data
        end

        # Delete a single Role by ID.
        # Required scope: "delete:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/delete_roles_by_id
        #
        # @param role_id [string] Role ID to delete.
        def delete_role(role_id)
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          delete "#{roles_path}/#{role_id}"
        end

        # Get Users assigned to a specific Role.
        # Required scopes:
        #   - "read:roles"
        #   - "read:users"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/get_role_user
        #
        # @param role_id [string] Role ID to which the Users belong to.
        # @param options [hash] A hash of options for getting Roles
        #   - per_page: Number of Roles to return.
        #   - page: Page number to return, zero-based.
        #   - include_totals: True to include query summary in the result, false or nil otherwise.
        def get_role_users(role_id, options = {})
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          request_params = {
            per_page: options.fetch(:per_page, nil),
            page: options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil)
          }
          get "#{roles_path}/#{role_id}/users", request_params
        end

        # Add one or more Users to a Role.
        # Required scopes: "update:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/post_role_users
        #
        # @param role_id [string] Role ID to add Users.
        # @param users [array] Array of string User IDs to add to the Role.
        def add_role_users(role_id, users = [])
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          validate_strings_array(users)
          post "#{roles_path}/#{role_id}/users", users: users
        end

        # Get the permissions associated to a Role.
        # Required scope: "read:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/get_role_permission
        #
        # @param role_id [string] Role ID to add permissions.
        # @param options [hash] A hash of options for getting permissions
        #   - per_page: Number or permissions to return.
        #   - page: Page number to return, zero-based
        #   - include_totals: True to include query summary in the result, false or nil otherwise.
        #
        # @return [json] All permissions matching the query.
        def get_role_permissions(role_id, options = {})
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          request_params = {
            per_page: options.fetch(:per_page, nil),
            page: options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil)
          }
          get "#{roles_path}/#{role_id}/permissions", request_params
        end

        # Associate permissions with a Role.
        # Required scope: "update:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/post_role_permission_assignment
        #
        # @param role_id [string] Role ID to add permissions.
        # @param permissions [array] Array of Permission structs to add.
        def add_role_permissions(role_id, permissions)
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          permissions = validate_permissions_array(permissions)
          post "#{roles_path}/#{role_id}/permissions", permissions: permissions
        end

        # Remove permissions from a Role.
        # Required scope: "update:roles"
        # @see https://auth0.com/docs/api/management/v2#!/Roles/delete_role_permission_assignment
        #
        # @param role_id [string] Role ID to remove permissions.
        # @param permissions [array] Array of Permission structs to remove.
        def remove_role_permissions(role_id, permissions)
          raise Auth0::MissingParameter, 'Must supply a valid role_id' if role_id.to_s.empty?

          permissions = validate_permissions_array(permissions)
          delete_with_body("#{roles_path}/#{role_id}/permissions", permissions: permissions)
        end

        private

        # Roles base API path
        def roles_path
          @roles_path ||= '/api/v2/roles'
        end
      end
    end
  end
end
