# frozen_string_literal: true

module Auth0
  module Organizations
    module Invitations
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve a detailed list of invitations sent to users for a specific Organization. The list includes details
        # such as inviter and invitee information, invitation URLs, and dates of creation and expiration. To learn more
        # about Organization invitations, review <a
        # href="https://auth0.com/docs/manage-users/organizations/configure-organizations/invite-members">Invite
        # Organization Members</a>.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Integer, nil] :page
        # @option params [Integer, nil] :per_page
        # @option params [Boolean, nil] :include_totals
        # @option params [String, nil] :fields
        # @option params [Boolean, nil] :include_fields
        # @option params [String, nil] :sort
        #
        # @return [Auth0::Types::ListOrganizationInvitationsOffsetPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[page per_page include_totals fields include_fields sort]
          query_params = {}
          query_params["page"] = params.fetch(:page, 0)
          query_params["per_page"] = params.fetch(:per_page, 50)
          query_params["include_totals"] = params.fetch(:include_totals, true)
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          params = params.except(*query_param_names)

          Auth0::Internal::OffsetItemIterator.new(
            initial_page: query_params["page"],
            item_field: :invitations,
            has_next_field: nil,
            step: true
          ) do |next_page|
            query_params["page"] = next_page
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/invitations",
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
              Auth0::Types::ListOrganizationInvitationsOffsetPaginatedResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Create a user invitation for a specific Organization. Upon creation, the listed user receives an email
        # inviting them to join the Organization. To learn more about Organization invitations, review <a
        # href="https://auth0.com/docs/manage-users/organizations/configure-organizations/invite-members">Invite
        # Organization Members</a>.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::Invitations::Types::CreateOrganizationInvitationRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Auth0::Types::CreateOrganizationInvitationResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::Invitations::Types::CreateOrganizationInvitationRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/invitations",
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
            Auth0::Types::CreateOrganizationInvitationResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :invitation_id
        # @option params [String, nil] :fields
        # @option params [Boolean, nil] :include_fields
        #
        # @return [Auth0::Types::GetOrganizationInvitationResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[fields include_fields]
          query_params = {}
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
          params = params.except(*query_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/invitations/#{URI.encode_uri_component(params[:invitation_id].to_s)}",
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
            Auth0::Types::GetOrganizationInvitationResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :invitation_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/invitations/#{URI.encode_uri_component(params[:invitation_id].to_s)}",
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
      end
    end
  end
end
