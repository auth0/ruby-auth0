# frozen_string_literal: true

module Auth0
  module Jobs
    module VerificationEmail
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Send an email to the specified user that asks them to click a link to <a
        # href="https://auth0.com/docs/email/custom#verification-email">verify their email address</a>.
        #
        # Note: You must have the `Status` toggle enabled for the verification email template for the email to be sent.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Jobs::VerificationEmail::Types::CreateVerificationEmailRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Auth0::Types::CreateVerificationEmailResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "jobs/verification-email",
            body: Auth0::Jobs::VerificationEmail::Types::CreateVerificationEmailRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::CreateVerificationEmailResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
