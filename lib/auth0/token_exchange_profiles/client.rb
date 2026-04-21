# frozen_string_literal: true

module Auth0
  module TokenExchangeProfiles
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve a list of all Token Exchange Profiles available in your tenant.
      #
      # By using this feature, you agree to the applicable Free Trial terms in <a
      # href="https://www.okta.com/legal/">Okta’s Master Subscription Agreement</a>. It is your responsibility to
      # securely validate the user’s subject_token. See <a
      # href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
      #
      # This endpoint supports Checkpoint pagination. To search by checkpoint, use the following parameters:
      # <ul>
      # <li><code>from</code>: Optional id from which to start selection.</li>
      # <li><code>take</code>: The total amount of entries to retrieve when using the from parameter. Defaults to
      # 50.</li>
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
      #
      # @return [Auth0::Types::ListTokenExchangeProfileResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[from take]
        query_params = {}
        query_params["from"] = params[:from] if params.key?(:from)
        query_params["take"] = params.fetch(:take, 50)
        params.except(*query_param_names)

        Auth0::Internal::CursorItemIterator.new(
          cursor_field: :next_,
          item_field: :token_exchange_profiles,
          initial_cursor: query_params["from"]
        ) do |next_cursor|
          query_params["from"] = next_cursor
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "token-exchange-profiles",
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
            Auth0::Types::ListTokenExchangeProfileResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Create a new Token Exchange Profile within your tenant.
      #
      # By using this feature, you agree to the applicable Free Trial terms in <a
      # href="https://www.okta.com/legal/">Okta’s Master Subscription Agreement</a>. It is your responsibility to
      # securely validate the user’s subject_token. See <a
      # href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
      #
      # @param request_options [Hash]
      # @param params [Auth0::TokenExchangeProfiles::Types::CreateTokenExchangeProfileRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::CreateTokenExchangeProfileResponseContent]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "token-exchange-profiles",
          body: Auth0::TokenExchangeProfiles::Types::CreateTokenExchangeProfileRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::CreateTokenExchangeProfileResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve details about a single Token Exchange Profile specified by ID.
      #
      # By using this feature, you agree to the applicable Free Trial terms in <a
      # href="https://www.okta.com/legal/">Okta’s Master Subscription Agreement</a>. It is your responsibility to
      # securely validate the user’s subject_token. See <a
      # href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
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
      # @return [Auth0::Types::GetTokenExchangeProfileResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "token-exchange-profiles/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetTokenExchangeProfileResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a Token Exchange Profile within your tenant.
      #
      # By using this feature, you agree to the applicable Free Trial terms in <a
      # href="https://www.okta.com/legal/">Okta's Master Subscription Agreement</a>. It is your responsibility to
      # securely validate the user's subject_token. See <a
      # href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
      #
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
          path: "token-exchange-profiles/#{URI.encode_uri_component(params[:id].to_s)}",
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

      # Update a Token Exchange Profile within your tenant.
      #
      # By using this feature, you agree to the applicable Free Trial terms in <a
      # href="https://www.okta.com/legal/">Okta's Master Subscription Agreement</a>. It is your responsibility to
      # securely validate the user's subject_token. See <a
      # href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
      #
      #
      # @param request_options [Hash]
      # @param params [Auth0::TokenExchangeProfiles::Types::UpdateTokenExchangeProfileRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [untyped]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::TokenExchangeProfiles::Types::UpdateTokenExchangeProfileRequestContent.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "token-exchange-profiles/#{URI.encode_uri_component(params[:id].to_s)}",
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
    end
  end
end
