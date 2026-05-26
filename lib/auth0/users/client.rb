# frozen_string_literal: true

module Auth0
  module Users
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve details of users. It is possible to:
      #
      # - Specify a search criteria for users
      # - Sort the users to be returned
      # - Select the fields to be returned
      # - Specify the number of users to retrieve per page and the page index
      #
      #
      #
      # The `q` query parameter can be used to get users that match the specified criteria [using query string
      # syntax.](https://auth0.com/docs/users/search/v3/query-syntax)
      #
      # [Learn more about searching for users.](https://auth0.com/docs/users/search/v3)
      #
      # Read about [best practices](https://auth0.com/docs/users/search/best-practices) when working with the API
      # endpoints for retrieving users.
      #
      #
      #
      # Auth0 limits the number of users you can return. If you exceed this threshold, please redefine your search, use
      # the [export job](https://auth0.com/docs/api/management/v2#!/Jobs/post_users_exports), or the [User Import /
      # Export](https://auth0.com/docs/extensions/user-import-export) extension.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      # @option params [Boolean, nil] :include_totals
      # @option params [String, nil] :sort
      # @option params [String, nil] :connection
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      # @option params [String, nil] :q
      # @option params [Auth0::Types::SearchEngineVersionsEnum, nil] :search_engine
      # @option params [Boolean, nil] :primary_order
      #
      # @return [Auth0::Types::ListUsersOffsetPaginatedResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["page"] = params.fetch(:page, 0)
        query_params["per_page"] = params.fetch(:per_page, 50)
        query_params["include_totals"] = params.fetch(:include_totals, true)
        query_params["sort"] = params[:sort] if params.key?(:sort)
        query_params["connection"] = params[:connection] if params.key?(:connection)
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
        query_params["q"] = params[:q] if params.key?(:q)
        query_params["search_engine"] = params[:search_engine] if params.key?(:search_engine)
        query_params["primary_order"] = params[:primary_order] if params.key?(:primary_order)

        Auth0::Internal::OffsetItemIterator.new(
          initial_page: query_params["page"],
          item_field: :users,
          has_next_field: nil,
          step: false
        ) do |next_page|
          query_params["page"] = next_page
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "users",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = Auth0::Types::ListUsersOffsetPaginatedResponseContent.load(response.body)
            [parsed_response, response]
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Create a new user for a given [database](https://auth0.com/docs/connections/database) or
      # [passwordless](https://auth0.com/docs/connections/passwordless) connection.
      #
      # Note: `connection` is required but other parameters such as `email` and `password` are dependent upon the type
      # of connection.
      #
      # @param request_options [Hash]
      # @param params [Auth0::Users::Types::CreateUserRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::CreateUserResponseContent]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "users",
          body: Auth0::Users::Types::CreateUserRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::CreateUserResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Find users by email. If Auth0 is the identity provider (idP), the email address associated with a user is saved
      # in lower case, regardless of how you initially provided it.
      #
      # For example, if you register a user as JohnSmith@example.com, Auth0 saves the user's email as
      # johnsmith@example.com.
      #
      # Therefore, when using this endpoint, make sure that you are searching for users via email addresses using the
      # correct case.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      # @option params [String] :email
      #
      # @return [Array[Auth0::Types::UserResponseSchema]]
      def list_users_by_email(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
        query_params["email"] = params[:email] if params.key?(:email)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "users-by-email",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Retrieve user details. A list of fields to include or exclude may also be specified. For more information, see
      # [Retrieve Users with the Get Users
      # Endpoint](https://auth0.com/docs/manage-users/user-search/retrieve-users-with-get-users-endpoint).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      #
      # @return [Auth0::Types::GetUserResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetUserResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a user by user ID. This action cannot be undone. For Auth0 Dashboard instructions, see [Delete
      # Users](https://auth0.com/docs/manage-users/user-accounts/delete-users).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Update a user.
      #
      # These are the attributes that can be updated at the root level:
      #
      # - app_metadata
      # - blocked
      # - email
      # - email_verified
      # - family_name
      # - given_name
      # - name
      # - nickname
      # - password
      # - phone_number
      # - phone_verified
      # - picture
      # - username
      # - user_metadata
      # - verify_email
      #
      # Some considerations:
      #
      # - The properties of the new object will replace the old ones.
      # - The metadata fields are an exception to this rule (`user_metadata` and `app_metadata`). These properties are
      # merged instead of being replaced but be careful, the merge only occurs on the first level.
      # - If you are updating `email`, `email_verified`, `phone_number`, `phone_verified`, `username` or `password` of a
      # secondary identity, you need to specify the `connection` property too.
      # - If you are updating `email` or `phone_number` you can specify, optionally, the `client_id` property.
      # - Updating `email_verified` is not supported for enterprise and passwordless sms connections.
      # - Updating the `blocked` to `false` does not affect the user's blocked state from an excessive amount of
      # incorrectly provided credentials. Use the "Unblock a user" endpoint from the "User Blocks" API to change the
      # user's state.
      # - Supported attributes can be unset by supplying `null` as the value.
      #
      # **Updating a field (non-metadata property)**
      #
      # To mark the email address of a user as verified, the body to send should be:
      #
      # ```json
      # { "email_verified": true }
      # ```
      #
      # **Updating a user metadata root property**
      #
      # Let's assume that our test user has the following `user_metadata`:
      #
      # ```json
      # { "user_metadata" : { "profileCode": 1479 } }
      # ```
      #
      # To add the field `addresses` the body to send should be:
      #
      # ```json
      # { "user_metadata" : { "addresses": {"work_address": "100 Industrial Way"} }}
      # ```
      #
      # The modified object ends up with the following `user_metadata` property:
      #
      # ```json
      # {
      #   "user_metadata": {
      #     "profileCode": 1479,
      #     "addresses": { "work_address": "100 Industrial Way" }
      #   }
      # }
      # ```
      #
      # **Updating an inner user metadata property**
      #
      # If there's existing user metadata to which we want to add  `"home_address": "742 Evergreen Terrace"` (using the
      # `addresses` property) we should send the whole `addresses` object. Since this is a first-level object, the
      # object will be merged in, but its own properties will not be. The body to send should be:
      #
      # ```json
      # {
      #   "user_metadata": {
      #     "addresses": {
      #       "work_address": "100 Industrial Way",
      #       "home_address": "742 Evergreen Terrace"
      #     }
      #   }
      # }
      # ```
      #
      # The modified object ends up with the following `user_metadata` property:
      #
      # ```json
      # {
      #   "user_metadata": {
      #     "profileCode": 1479,
      #     "addresses": {
      #       "work_address": "100 Industrial Way",
      #       "home_address": "742 Evergreen Terrace"
      #     }
      #   }
      # }
      # ```
      #
      # @param request_options [Hash]
      # @param params [Auth0::Users::Types::UpdateUserRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::UpdateUserResponseContent]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::Users::Types::UpdateUserRequestContent.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::UpdateUserResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Remove an existing multi-factor authentication (MFA) [recovery
      # code](https://auth0.com/docs/secure/multi-factor-authentication/reset-user-mfa) and generate a new one. If a
      # user cannot access the original device or account used for MFA enrollment, they can use a recovery code to
      # authenticate.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::RegenerateUsersRecoveryCodeResponseContent]
      def regenerate_recovery_code(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/recovery-code-regeneration",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::RegenerateUsersRecoveryCodeResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Revokes selected resources related to a user (sessions, refresh tokens, ...).
      #
      # @param request_options [Hash]
      # @param params [Auth0::Users::Types::RevokeUserAccessRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [untyped]
      def revoke_access(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::Users::Types::RevokeUserAccessRequestContent.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/revoke-access",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # @return [Auth0::AuthenticationMethods::Client]
      def authentication_methods
        @authentication_methods ||= Auth0::Users::AuthenticationMethods::Client.new(client: @client)
      end

      # @return [Auth0::Authenticators::Client]
      def authenticators
        @authenticators ||= Auth0::Users::Authenticators::Client.new(client: @client)
      end

      # @return [Auth0::ConnectedAccounts::Client]
      def connected_accounts
        @connected_accounts ||= Auth0::Users::ConnectedAccounts::Client.new(client: @client)
      end

      # @return [Auth0::Enrollments::Client]
      def enrollments
        @enrollments ||= Auth0::Users::Enrollments::Client.new(client: @client)
      end

      # @return [Auth0::FederatedConnectionsTokensets::Client]
      def federated_connections_tokensets
        @federated_connections_tokensets ||= Auth0::Users::FederatedConnectionsTokensets::Client.new(client: @client)
      end

      # @return [Auth0::Groups::Client]
      def groups
        @groups ||= Auth0::Users::Groups::Client.new(client: @client)
      end

      # @return [Auth0::Identities::Client]
      def identities
        @identities ||= Auth0::Users::Identities::Client.new(client: @client)
      end

      # @return [Auth0::Logs::Client]
      def logs
        @logs ||= Auth0::Users::Logs::Client.new(client: @client)
      end

      # @return [Auth0::Multifactor::Client]
      def multifactor
        @multifactor ||= Auth0::Users::Multifactor::Client.new(client: @client)
      end

      # @return [Auth0::Organizations::Client]
      def organizations
        @organizations ||= Auth0::Users::Organizations::Client.new(client: @client)
      end

      # @return [Auth0::Permissions::Client]
      def permissions
        @permissions ||= Auth0::Users::Permissions::Client.new(client: @client)
      end

      # @return [Auth0::RiskAssessments::Client]
      def risk_assessments
        @risk_assessments ||= Auth0::Users::RiskAssessments::Client.new(client: @client)
      end

      # @return [Auth0::Roles::Client]
      def roles
        @roles ||= Auth0::Users::Roles::Client.new(client: @client)
      end

      # @return [Auth0::RefreshToken::Client]
      def refresh_token
        @refresh_token ||= Auth0::Users::RefreshToken::Client.new(client: @client)
      end

      # @return [Auth0::Sessions::Client]
      def sessions
        @sessions ||= Auth0::Users::Sessions::Client.new(client: @client)
      end
    end
  end
end
