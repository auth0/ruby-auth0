# frozen_string_literal: true

module Auth0
  module SelfServiceProfiles
    module SSOTicket
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Creates an SSO access ticket to initiate the Self Service SSO Flow using a self-service profile.
        #
        # @param request_options [Hash]
        # @param params [Auth0::SelfServiceProfiles::SSOTicket::Types::CreateSelfServiceProfileSSOTicketRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Auth0::Types::CreateSelfServiceProfileSSOTicketResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::SelfServiceProfiles::SSOTicket::Types::CreateSelfServiceProfileSSOTicketRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "self-service-profiles/#{URI.encode_uri_component(params[:id].to_s)}/sso-ticket",
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
            Auth0::Types::CreateSelfServiceProfileSSOTicketResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Revokes an SSO access ticket and invalidates associated sessions. The ticket will no longer be accepted to
        # initiate a Self-Service SSO session. If any users have already started a session through this ticket, their
        # session will be terminated. Clients should expect a `202 Accepted` response upon successful processing,
        # indicating that the request has been acknowledged and that the revocation is underway but may not be fully
        # completed at the time of response. If the specified ticket does not exist, a `202 Accepted` response is also
        # returned, signaling that no further action is required.
        # Clients should treat these `202` responses as an acknowledgment that the request has been accepted and is in
        # progress, even if the ticket was not found.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :profile_id
        # @option params [String] :id
        #
        # @return [untyped]
        def revoke(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "self-service-profiles/#{URI.encode_uri_component(params[:profile_id].to_s)}/sso-ticket/#{URI.encode_uri_component(params[:id].to_s)}/revoke",
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
