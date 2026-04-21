# frozen_string_literal: true

module Auth0
  module Organizations
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve detailed list of all Organizations available in your tenant. For more information, see Auth0
      # Organizations.
      #
      # This endpoint supports two types of pagination:
      # <ul>
      # <li>Offset pagination</li>
      # <li>Checkpoint pagination</li>
      # </ul>
      #
      # Checkpoint pagination must be used if you need to retrieve more than 1000 organizations.
      #
      # <h2>Checkpoint Pagination</h2>
      #
      # To search by checkpoint, use the following parameters:
      # <ul>
      # <li><code>from</code>: Optional id from which to start selection.</li>
      # <li><code>take</code>: The total number of entries to retrieve when using the <code>from</code> parameter.
      # Defaults to 50.</li>
      # </ul>
      #
      # <b>Note</b>: The first time you call this endpoint using checkpoint pagination, omit the <code>from</code>
      # parameter. If there are more results, a <code>next</code> value is included in the response. You can use this
      # for subsequent API calls. When <code>next</code> is no longer included in the response, no pages are remaining.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :from
      # @option params [Integer, nil] :take
      # @option params [String, nil] :sort
      #
      # @return [Auth0::Types::ListOrganizationsPaginatedResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[from take sort]
        query_params = {}
        query_params["from"] = params[:from] if params.key?(:from)
        query_params["take"] = params.fetch(:take, 50)
        query_params["sort"] = params[:sort] if params.key?(:sort)
        params.except(*query_param_names)

        Auth0::Internal::CursorItemIterator.new(
          cursor_field: :next_,
          item_field: :organizations,
          initial_cursor: query_params["from"]
        ) do |next_cursor|
          query_params["from"] = next_cursor
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "organizations",
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
            Auth0::Types::ListOrganizationsPaginatedResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Create a new Organization within your tenant.  To learn more about Organization settings, behavior, and
      # configuration options, review <a
      # href="https://auth0.com/docs/manage-users/organizations/create-first-organization">Create Your First
      # Organization</a>.
      #
      # @param request_options [Hash]
      # @param params [Auth0::Organizations::Types::CreateOrganizationRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::CreateOrganizationResponseContent]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "organizations",
          body: Auth0::Organizations::Types::CreateOrganizationRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::CreateOrganizationResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve details about a single Organization specified by name.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :name
      #
      # @return [Auth0::Types::GetOrganizationByNameResponseContent]
      def get_by_name(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "organizations/name/#{URI.encode_uri_component(params[:name].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetOrganizationByNameResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve details about a single Organization specified by ID.
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
      # @return [Auth0::Types::GetOrganizationResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetOrganizationResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Remove an Organization from your tenant.  This action cannot be undone.
      #
      # <b>Note</b>: Members are automatically disassociated from an Organization when it is deleted. However, this
      # action does <b>not</b> delete these users from your tenant.
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
          path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}",
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

      # Update the details of a specific <a
      # href="https://auth0.com/docs/manage-users/organizations/configure-organizations/create-organizations">Organization</a>,
      # such as name and display name, branding options, and metadata.
      #
      # @param request_options [Hash]
      # @param params [Auth0::Organizations::Types::UpdateOrganizationRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::UpdateOrganizationResponseContent]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::Organizations::Types::UpdateOrganizationRequestContent.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Auth0::Types::UpdateOrganizationResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Auth0::ClientGrants::Client]
      def client_grants
        @client_grants ||= Auth0::Organizations::ClientGrants::Client.new(client: @client)
      end

      # @return [Auth0::Connections::Client]
      def connections
        @connections ||= Auth0::Organizations::Connections::Client.new(client: @client)
      end

      # @return [Auth0::DiscoveryDomains::Client]
      def discovery_domains
        @discovery_domains ||= Auth0::Organizations::DiscoveryDomains::Client.new(client: @client)
      end

      # @return [Auth0::EnabledConnections::Client]
      def enabled_connections
        @enabled_connections ||= Auth0::Organizations::EnabledConnections::Client.new(client: @client)
      end

      # @return [Auth0::Invitations::Client]
      def invitations
        @invitations ||= Auth0::Organizations::Invitations::Client.new(client: @client)
      end

      # @return [Auth0::Members::Client]
      def members
        @members ||= Auth0::Organizations::Members::Client.new(client: @client)
      end
    end
  end
end
