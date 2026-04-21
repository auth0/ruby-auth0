# frozen_string_literal: true

module Auth0
  module Organizations
    module DiscoveryDomains
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve list of all organization discovery domains associated with the specified organization.
        # This endpoint is subject to eventual consistency; newly created, updated, or deleted discovery domains may not
        # immediately appear in the response.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String, nil] :from
        # @option params [Integer, nil] :take
        #
        # @return [Auth0::Types::ListOrganizationDiscoveryDomainsResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[from take]
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          params = params.except(*query_param_names)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :domains,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/discovery-domains",
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
              Auth0::Types::ListOrganizationDiscoveryDomainsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Create a new discovery domain for an organization.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::DiscoveryDomains::Types::CreateOrganizationDiscoveryDomainRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Auth0::Types::CreateOrganizationDiscoveryDomainResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::DiscoveryDomains::Types::CreateOrganizationDiscoveryDomainRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/discovery-domains",
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
            Auth0::Types::CreateOrganizationDiscoveryDomainResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve details about a single organization discovery domain specified by domain name.
        # This endpoint is subject to eventual consistency; newly created, updated, or deleted discovery domains may not
        # immediately appear in the response.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :discovery_domain
        #
        # @return [Auth0::Types::GetOrganizationDiscoveryDomainByNameResponseContent]
        def get_by_name(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/discovery-domains/name/#{URI.encode_uri_component(params[:discovery_domain].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetOrganizationDiscoveryDomainByNameResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve details about a single organization discovery domain specified by ID.
        # This endpoint is subject to eventual consistency; newly created, updated, or deleted discovery domains may not
        # immediately appear in the response.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :discovery_domain_id
        #
        # @return [Auth0::Types::GetOrganizationDiscoveryDomainResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/discovery-domains/#{URI.encode_uri_component(params[:discovery_domain_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetOrganizationDiscoveryDomainResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Remove a discovery domain from an organization. This action cannot be undone.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :discovery_domain_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/discovery-domains/#{URI.encode_uri_component(params[:discovery_domain_id].to_s)}",
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

        # Update the verification status and/or use_for_organization_discovery for an organization discovery domain. The
        # <code>status</code> field must be either <code>pending</code> or <code>verified</code>. The
        # <code>use_for_organization_discovery</code> field can be <code>true</code> or <code>false</code> (default:
        # <code>true</code>).
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::DiscoveryDomains::Types::UpdateOrganizationDiscoveryDomainRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :discovery_domain_id
        #
        # @return [Auth0::Types::UpdateOrganizationDiscoveryDomainResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::DiscoveryDomains::Types::UpdateOrganizationDiscoveryDomainRequestContent.new(params).to_h
          non_body_param_names = %w[id discovery_domain_id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/discovery-domains/#{URI.encode_uri_component(params[:discovery_domain_id].to_s)}",
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
            Auth0::Types::UpdateOrganizationDiscoveryDomainResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
