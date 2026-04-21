# frozen_string_literal: true

module Auth0
  module Jobs
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves a job. Useful to check its status.
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
      # @return [Auth0::Types::GetJobResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "jobs/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetJobResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Auth0::UsersExports::Client]
      def users_exports
        @users_exports ||= Auth0::Jobs::UsersExports::Client.new(client: @client)
      end

      # @return [Auth0::UsersImports::Client]
      def users_imports
        @users_imports ||= Auth0::Jobs::UsersImports::Client.new(client: @client)
      end

      # @return [Auth0::VerificationEmail::Client]
      def verification_email
        @verification_email ||= Auth0::Jobs::VerificationEmail::Client.new(client: @client)
      end

      # @return [Auth0::Errors::Client]
      def errors
        @errors ||= Auth0::Jobs::Errors::Client.new(client: @client)
      end
    end
  end
end
