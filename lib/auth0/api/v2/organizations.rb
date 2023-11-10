module Auth0
  module Api
    module V2
      # Methods to use the organizations endpoints
      module Organizations
        include Auth0::Mixins::Validation

        attr_reader :organizations_path

        # Get all organizations.
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_organizations
        # @param options [hash] The Hash options used to define the paging of results
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer] The page number. Zero based.
        #   * :from [string] For checkpoint pagination, the ID from which to start selection from.
        #   * :take [integer] For checkpoint pagination, the number of entries to retrieve. Default is 50.
        #   * :include_totals [boolean] True to include query summary in the result, false or nil otherwise.
        # @return [json] All Organizations
        def organizations(options = {})
          request_params = {
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            from:           options.fetch(:from, nil),
            take:           options.fetch(:take, nil),
            include_totals: options.fetch(:include_totals, nil)
          }
          get(organizations_path, request_params)
        end
        alias get_organizations organizations

        # Create a new organization.
        # @see ttps://auth0.com/docs/api/management/v2/#!/Organizations/post_organizations
        # @param options [hash] See https://auth0.com/docs/api/management/v2/#!/Organizations/post_organizations for available options
        # @return [json] Returns the created organization.
        def create_organization(options = {})
          post(organizations_path, options)
        end

        # Get an organization by id. A token with read:organizations scope is required
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_organizations_by_id
        # @param organization_id [string] The organization_id of the user to retrieve.
        #
        # @return [json] Returns the organization with the given organization_id if it exists.
        def organization(organization_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          path = "#{organizations_path}/#{organization_id}"
          get(path)
        end

        # Get an organization by name. A token with read:organizations scope is required.
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_name_by_name
        # @param organization_name [string] The Organization name
        #
        # @return [json] Returns the organization with the given organization_name if it exists.
        def organization_by_name(organization_name)
          raise Auth0::InvalidParameter, 'Must supply a valid organization_name' if organization_name.to_s.empty?
          path = "#{organizations_path}/name/#{organization_name}"
          get(path)
        end


        # Deletes a single organization given its id
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/delete_organizations_by_id
        # @param organization_id [string] The Organization ID
        def delete_organization(organization_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          path = "#{organizations_path}/#{organization_id}"
          delete(path)
        end

        # Update an existing organization.
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/patch_organizations_by_id
        # @param organization_id [string] The Organization ID
        # @param body [hash] The optional parameters to update.
        #
        # @return [json] Returns the updated user.
        def patch_organization(organization_id, body)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty? || body.empty?
          path = "#{organizations_path}/#{organization_id}"
          patch(path, body)
        end
        alias update_organization patch_organization

        ### Organization Enabled Connections

        # Get enabled connections in an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_enabled_connections
        # @param organization_id [string] The Organization ID
        #
        # @return [json] Returns the enabled connections for the given organization
        def get_organizations_enabled_connections(organization_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          path = "#{organizations_enabled_connections_path(organization_id)}"
          get(path)
        end

        # Get enabled connection by id in an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_enabled_connections_by_connectionId
        # @param organization_id [string] The Organization ID
        # @param connection_id [string] The Connection id
        #
        # @return [json] Returns the connection for the given organization
        def get_organizations_enabled_connection(organization_id, connection_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "#{organizations_enabled_connections_path(organization_id)}/#{connection_id}"
          get(path)
        end

        # Update an eanbled connection in an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/patch_enabled_connections_by_connectionId
        # @param organization_id [string] The Organization ID
        # @param connection_id [string] The Connection id
        # @param assign_membership_on_login [boolean] flag to allow assign membership on login
        #
        # @return [json] Returns the connection for the given organization
        def patch_organizations_enabled_connection(organization_id, connection_id, assign_membership_on_login: nil)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid assign_membership_on_login value' if assign_membership_on_login.nil?
          path = "#{organizations_enabled_connections_path(organization_id)}/#{connection_id}"

          body = {}
          body[:assign_membership_on_login] = assign_membership_on_login

          patch(path, body)
        end
        alias update_organizations_enabled_connection patch_organizations_enabled_connection

        # Add an enabled connection for an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/post_enabled_connections
        # @param organization_id [string] The Organization ID
        # @param connection_id [string] The Organization ID
        # @param assign_membership_on_login [boolean] flag to allow assign membership on login
        #
        # @return [json] Returns the connection for the given organization
        def create_organizations_enabled_connection(organization_id, connection_id, assign_membership_on_login: false)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "#{organizations_enabled_connections_path(organization_id)}"
          
          body = {}
          body[:assign_membership_on_login] = assign_membership_on_login
          body[:connection_id] = connection_id

          post(path, body)
        end
        alias add_organizations_enabled_connection create_organizations_enabled_connection

        # Remove an enabled connection from an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/delete_enabled_connections_by_connectionId
        # @param organization_id [string] The Organization ID
        # @param connection_id [string] The Connection id
        def delete_organizations_enabled_connection(organization_id, connection_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid connection id' if connection_id.to_s.empty?
          path = "#{organizations_enabled_connections_path(organization_id)}/#{connection_id}"
          delete(path)
        end
        alias remove_organizations_enabled_connection delete_organizations_enabled_connection

        ### Organization Invites

        # Get invites in an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_invitations
        # @param organization_id [string] The Organization ID
        #
        # @return [json] Returns the invites for the given organization
        def get_organizations_invites(organization_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          path = "#{organizations_invitations_path(organization_id)}"
          get(path)
        end

        # Get invite by id in an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_invitations_by_invitation_id
        # @param organization_id [string] The Organization ID
        # @param invitation_id [string] The invitation id
        #
        # @return [json] Returns the invitation for the given organization
        def get_organizations_invite(organization_id, invitation_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid invitation id' if invitation_id.to_s.empty?
          path = "#{organizations_invitations_path(organization_id)}/#{invitation_id}"
          get(path)
        end

        # Create an invitation in an organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/post_invitations
        # @param organization_id [string] The Organization ID
        # @param options [hash] See https://auth0.com/docs/api/management/v2/#!/Organizations/post_invitations
        # @return [json] Returns the invitation for the given organization
        def create_organizations_invite(organization_id, options = {})
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          path = "#{organizations_invitations_path(organization_id)}"
          
          post(path, options)
        end
        alias add_organizations_invite create_organizations_invite

        # Delete an invitation to organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/delete_invitations_by_invitation_id
        # @param organization_id [string] The Organization ID
        # @param invitation_id [string] The Invitation id
        def delete_organizations_invite(organization_id, invitation_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid invitation id' if invitation_id.to_s.empty?
          path = "#{organizations_invitations_path(organization_id)}/#{invitation_id}"
          delete(path)
        end
        alias remove_organizations_invite delete_organizations_invite

        ### Organization Member

        # Get Members in a Organization
        # Member roles are not sent by default. Use `fields=roles` to retrieve the roles assigned to each listed member.
        # To use this parameter, you must include the `read:organization_member_roles scope` in the token.
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_members
        # @param organization_id [string] The Organization ID
        # @param options [hash] The Hash options used to define the paging of rersults
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer] The page number. Zero based.
        #   * :from [string] For checkpoint pagination, the ID from which to start selection from.
        #   * :take [integer] For checkpoint pagination, the number of entries to retrieve. Default is 50.
        #   * :include_totals [boolean] True to include query summary in the result, false or nil otherwise.
        #   * :fields [string] A comma separated list of fields to include or exclude from the result. If fields is left blank, all fields (except roles) are returned.
        #   * :include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the members for the given organization
        def get_organizations_members(organization_id, options = {})
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          request_params = {
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            from:           options.fetch(:from, nil),
            take:           options.fetch(:take, nil),
            include_totals: options.fetch(:include_totals, nil),
            fields: options.fetch(:fields, nil),
            include_fields: options.fetch(:include_fields, nil)
          }
          path = "#{organizations_members_path(organization_id)}"
          get(path, request_params)
        end

        # Add members in an organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/post_members
        # @param organization_id [string] The Organization ID
        # @param members [array] Array of user IDs.
        #
        # @return [json] Returns the invitation for the given organization
        def create_organizations_members(organization_id, members = [])
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply an array of member ids' if members.empty?
          path = "#{organizations_members_path(organization_id)}"
          
          body = {}
          body[:members] = members

          post(path, body)
        end
        alias add_organizations_members create_organizations_members

        # Remove members from an organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/delete_members
        # @param organization_id [string] The Organization ID
        # @param members [array] Array of user IDs.
        def delete_organizations_members(organization_id, members = [])
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply an array of member ids' if members.empty?
          path = "#{organizations_members_path(organization_id)}"

          body = {}
          body[:members] = members

          delete_with_body(path, body)
        end
        alias remove_organizations_members delete_organizations_members

        ### Organization Member Roles

        # Get Roles assigned to a Member in an Organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/get_organization_member_roles
        # @param organization_id [string] The Organization ID
        # @param user_id [string] The User ID
        #
        # @return [json] Returns the member_roles for the given organization
        def get_organizations_member_roles(organization_id, user_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid user id' if user_id.to_s.empty?
          path = "#{organizations_member_roles_path(organization_id, user_id)}"
          get(path)
        end

        # Assign roles to a member in an organization
        # @see https://auth0.com/docs/api/management/v2/#!/Organizations/post_organization_member_roles
        # @param organization_id [string] The Organization ID
        # @param user_id [string] The User ID
        # @param roles [array] Array of role IDs.
        #
        # @return [json] Returns the invitation for the given organization
        def create_organizations_member_roles(organization_id, user_id, roles = [])
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid user id' if user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply an array of role ids' if roles.empty?
          path = "#{organizations_member_roles_path(organization_id, user_id)}"
          
          body = {}
          body[:roles] = roles

          post(path, body)
        end
        alias add_organizations_member_roles create_organizations_member_roles

        # Remove roles from a Member of an organization
        # @https://auth0.com/docs/api/management/v2/#!/Organizations/delete_organization_member_roles
        # @param organization_id [string] The Organization ID
        # @param user_id [string] The User ID
        # @param roles [array] Array of role IDs.
        def delete_organizations_member_roles(organization_id, user_id, roles = [])
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid user id' if user_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply an array of role ids' if roles.empty?
          path = "#{organizations_member_roles_path(organization_id, user_id)}"
                    
          body = {}
          body[:roles] = roles

          delete_with_body(path, body)
        end
        alias remove_organizations_member_roles delete_organizations_member_roles

        # Get client grants associated to an organization
        # @param organization_id [string] The Organization ID
        # @param options [hash] The Hash options used to define the paging of results
        #   * :client_id [string] The client_id of the client grant to retrieve.
        #   * :audience [string] The audience of the client grant to retrieve.
        #   * :per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        #   * :page [integer] The page number. Zero based.
        #   * :include_totals [boolean] True to include query summary in the result, false or nil otherwise.
        def get_organizations_client_grants(organization_id, options= {})
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          request_params = {
            client_id:      options.fetch(:client_id, nil),
            audience:       options.fetch(:audience, nil),
            per_page:       options.fetch(:per_page, nil),
            page:           options.fetch(:page, nil),
            include_totals: options.fetch(:include_totals, nil)
          }
          path = "#{organizations_client_grants_path(organization_id)}"
          get(path, request_params)
        end

        # Associate a client grant with an organization
        # @param organization_id [string] The Organization ID
        # @param grant_id [string] The Client Grant ID you want to associate to the Organization.
        def create_organizations_client_grant(organization_id, grant_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid grant_id' if grant_id.to_s.empty?
          
          body = {}
          body[:grant_id] = grant_id

          path = "#{organizations_client_grants_path(organization_id)}"
          post(path, body)
        end

        # Remove a client grant from an organization
        # @param organization_id [string] The Organization ID
        # @param grant_id [string] The Client Grant ID you want to remove from the Organization.
        def delete_organizations_client_grant(organization_id, grant_id)
          raise Auth0::MissingOrganizationId, 'Must supply a valid organization_id' if organization_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid grant_id' if grant_id.empty?

          path = "#{organizations_path}/#{organization_id}/client-grants/#{grant_id}"
          delete(path)
        end

        private
        # Organizations API path
        def organizations_path
          @organizations_path ||= '/api/v2/organizations'
        end

        def organizations_enabled_connections_path(org_id)
          "#{organizations_path}/#{org_id}/enabled_connections"
        end

        def organizations_members_path(org_id)
          "#{organizations_path}/#{org_id}/members"
        end

        def organizations_member_roles_path(org_id, user_id)
          "#{organizations_path}/#{org_id}/members/#{user_id}/roles"
        end

        def organizations_invitations_path(org_id)
          "#{organizations_path}/#{org_id}/invitations"
        end

        def organizations_client_grants_path(org_id)
          "#{organizations_path}/#{org_id}/client-grants"
        end
      end
    end
  end
end
