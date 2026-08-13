# frozen_string_literal: true

module Auth0
  module Emails
    module Provider
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve details of the [email provider
        # configuration](https://auth0.com/docs/customize/email/smtp-email-providers) in your tenant. A list of fields
        # to include or exclude may also be specified.
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
        #
        # @return [Auth0::Types::GetEmailProviderResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "emails/provider",
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
            Auth0::Types::GetEmailProviderResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create an [email provider](https://auth0.com/docs/email/providers). The `credentials` object
        # requires different properties depending on the email provider (which is specified using the `name` property):
        #
        # - `mandrill` requires `api_key`
        # - `sendgrid` requires `api_key`
        # - `sparkpost` requires `api_key`. Optionally, set `region` to `eu` to use
        #     the SparkPost service hosted in Western Europe; set to `null` to use the SparkPost service hosted in
        #     North America. `eu` or `null` are the only valid values for `region`.
        # - `mailgun` requires `api_key` and `domain`. Optionally, set `region` to
        #     `eu` to use the Mailgun service hosted in Europe; set to `null` otherwise. `eu` or
        #     `null` are the only valid values for `region`.
        # - `ses` requires `accessKeyId`, `secretAccessKey`, and `region`
        # - `smtp` requires `smtp_host`, `smtp_port`, `smtp_user`, and
        #     `smtp_pass`
        #
        # Depending on the type of provider it is possible to specify `settings` object with different configuration
        # options, which will be used when sending an email:
        #
        # - `smtp` provider, `settings` may contain `headers` object.
        #     - When using AWS SES SMTP host, you may provide a name of configuration set in
        #       `X-SES-Configuration-Set` header. Value must be a string.
        #     - When using Sparkpost host, you may provide value for
        #       `X-MSYS_API` header. Value must be an object.
        # - For `ses` provider, `settings` may contain `message` object, where you can provide
        #   a name of configuration set in `configuration_set_name` property. Value must be a string.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Emails::Provider::Types::CreateEmailProviderRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Auth0::Types::CreateEmailProviderResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "emails/provider",
            body: Auth0::Emails::Provider::Types::CreateEmailProviderRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::CreateEmailProviderResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete the email provider.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [untyped]
        def delete(request_options: {}, **_params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "emails/provider",
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

        # Update an [email provider](https://auth0.com/docs/email/providers). The `credentials` object
        # requires different properties depending on the email provider (which is specified using the `name` property):
        #
        # - `mandrill` requires `api_key`
        # - `sendgrid` requires `api_key`
        # - `sparkpost` requires `api_key`. Optionally, set `region` to `eu` to use
        #     the SparkPost service hosted in Western Europe; set to `null` to use the SparkPost service hosted in
        #     North America. `eu` or `null` are the only valid values for `region`.
        # - `mailgun` requires `api_key` and `domain`. Optionally, set `region` to
        #     `eu` to use the Mailgun service hosted in Europe; set to `null` otherwise. `eu` or
        #     `null` are the only valid values for `region`.
        # - `ses` requires `accessKeyId`, `secretAccessKey`, and `region`
        # - `smtp` requires `smtp_host`, `smtp_port`, `smtp_user`, and
        #     `smtp_pass`
        #
        # Depending on the type of provider it is possible to specify `settings` object with different configuration
        # options, which will be used when sending an email:
        #
        # - `smtp` provider, `settings` may contain `headers` object.
        #     - When using AWS SES SMTP host, you may provide a name of configuration set in
        #       `X-SES-Configuration-Set` header. Value must be a string.
        #     - When using Sparkpost host, you may provide value for
        #       `X-MSYS_API` header. Value must be an object.
        #
        #   For `ses` provider, `settings` may contain `message` object, where you can provide
        #   a name of configuration set in `configuration_set_name` property. Value must be a string.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Emails::Provider::Types::UpdateEmailProviderRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Auth0::Types::UpdateEmailProviderResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "emails/provider",
            body: Auth0::Emails::Provider::Types::UpdateEmailProviderRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::UpdateEmailProviderResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
