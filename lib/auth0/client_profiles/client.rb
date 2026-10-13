# frozen_string_literal: true

module Auth0
  module ClientProfiles
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve a paginated list of client profiles for the tenant. Uses checkpoint pagination: pass the
      # <code>next</code> cursor from a previous response as the <code>from</code> query parameter to retrieve the
      # following page.
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
      #
      # @example
      #   client.client_profiles.list(
      #     from: "from",
      #     take: 1
      #   )
      #
      # @return [Auth0::Types::ListClientProfilesPaginatedResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["from"] = params[:from] if params.key?(:from)
        query_params["take"] = params.fetch(:take, 50)

        Auth0::Internal::CursorItemIterator.new(
          cursor_field: :next_,
          item_field: :client_profiles,
          initial_cursor: query_params["from"]
        ) do |next_cursor|
          query_params["from"] = next_cursor
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "client-profiles",
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
            parsed_response = (response.body.to_s.empty? ? nil : Auth0::Types::ListClientProfilesPaginatedResponseContent.load(response.body))
            [parsed_response, response]
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Create a client profile. At most one profile is allowed per tenant in this release; attempting to create a
      # second returns <code>409 Conflict</code>. The profile governs Dynamic CIMD clients matched by its
      # <code>apply_policy</code> at runtime.
      #
      # @param request_options [Hash]
      # @param params [Auth0::ClientProfiles::Types::CreateClientProfileRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.client_profiles.create(
      #     name: "name",
      #     client_configuration: {},
      #     apply_policy: {
      #       external_metadata_type: "cimd",
      #       external_metadata_created_by: "client"
      #     }
      #   )
      #
      # @return [Auth0::Types::ClientProfile]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "client-profiles",
          body: Auth0::ClientProfiles::Types::CreateClientProfileRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Auth0::Types::ClientProfile.load(response.body))
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve a single client profile by its identifier. Returns <code>404</code> if no profile with the given ID
      # exists for the tenant.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Auth0::Types::ClientProfileID] :id
      #
      # @example
      #   client.client_profiles.get(id: "id")
      #
      # @return [Auth0::Types::ClientProfile]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "client-profiles/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Auth0::Types::ClientProfile.load(response.body))
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a client profile. Idempotent: returns <code>204 No Content</code> whether or not a profile with the given
      # ID existed. Deleting the profile removes fleet governance for matched clients immediately.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Auth0::Types::ClientProfileID] :id
      #
      # @example
      #   client.client_profiles.delete(id: "id")
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "client-profiles/#{URI.encode_uri_component(params[:id].to_s)}",
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

      # Update a client profile. Supports partial updates at the top level (JSON Merge Patch); omitted top-level fields
      # remain unchanged. Nested objects such as <code>client_configuration</code> must be supplied in full.
      #
      # @param request_options [Hash]
      # @param params [Auth0::ClientProfiles::Types::UpdateClientProfileRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Auth0::Types::ClientProfileID] :id
      #
      # @example
      #   client.client_profiles.update(id: "id")
      #
      # @return [Auth0::Types::ClientProfile]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::ClientProfiles::Types::UpdateClientProfileRequestContent.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "client-profiles/#{URI.encode_uri_component(params[:id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Auth0::Types::ClientProfile.load(response.body))
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
