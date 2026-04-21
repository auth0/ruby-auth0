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

        # Retrieve details of the <a href="https://auth0.com/docs/customize/email/smtp-email-providers">email provider
        # configuration</a> in your tenant. A list of fields to include or exclude may also be specified.
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
          query_param_names = %i[fields include_fields]
          query_params = {}
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
          params.except(*query_param_names)

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

        # Create an <a href="https://auth0.com/docs/email/providers">email provider</a>. The <code>credentials</code>
        # object
        # requires different properties depending on the email provider (which is specified using the <code>name</code>
        # property):
        # <ul>
        #   <li><code>mandrill</code> requires <code>api_key</code></li>
        #   <li><code>sendgrid</code> requires <code>api_key</code></li>
        #   <li>
        # <code>sparkpost</code> requires <code>api_key</code>. Optionally, set <code>region</code> to <code>eu</code>
        # to use
        # the SparkPost service hosted in Western Europe; set to <code>null</code> to use the SparkPost service hosted
        # in
        #     North America. <code>eu</code> or <code>null</code> are the only valid values for <code>region</code>.
        #   </li>
        #   <li>
        # <code>mailgun</code> requires <code>api_key</code> and <code>domain</code>. Optionally, set
        # <code>region</code> to
        # <code>eu</code> to use the Mailgun service hosted in Europe; set to <code>null</code> otherwise.
        # <code>eu</code> or
        #     <code>null</code> are the only valid values for <code>region</code>.
        #   </li>
        # <li><code>ses</code> requires <code>accessKeyId</code>, <code>secretAccessKey</code>, and
        # <code>region</code></li>
        #   <li>
        #     <code>smtp</code> requires <code>smtp_host</code>, <code>smtp_port</code>, <code>smtp_user</code>, and
        #     <code>smtp_pass</code>
        #   </li>
        # </ul>
        # Depending on the type of provider it is possible to specify <code>settings</code> object with different
        # configuration
        # options, which will be used when sending an email:
        # <ul>
        #   <li>
        #     <code>smtp</code> provider, <code>settings</code> may contain <code>headers</code> object.
        #     <ul>
        #       <li>
        #         When using AWS SES SMTP host, you may provide a name of configuration set in
        #         <code>X-SES-Configuration-Set</code> header. Value must be a string.
        #       </li>
        #       <li>
        #         When using Sparkpost host, you may provide value for
        #         <code>X-MSYS_API</code> header. Value must be an object.
        #       </li>
        #     </ul>
        #   </li>
        #   <li>
        # for <code>ses</code> provider, <code>settings</code> may contain <code>message</code> object, where you can
        # provide
        #     a name of configuration set in <code>configuration_set_name</code> property. Value must be a string.
        #   </li>
        # </ul>
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
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          Auth0::Internal::Types::Utils.normalize_keys(params)
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

        # Update an <a href="https://auth0.com/docs/email/providers">email provider</a>. The <code>credentials</code>
        # object
        # requires different properties depending on the email provider (which is specified using the <code>name</code>
        # property):
        # <ul>
        #   <li><code>mandrill</code> requires <code>api_key</code></li>
        #   <li><code>sendgrid</code> requires <code>api_key</code></li>
        #   <li>
        # <code>sparkpost</code> requires <code>api_key</code>. Optionally, set <code>region</code> to <code>eu</code>
        # to use
        # the SparkPost service hosted in Western Europe; set to <code>null</code> to use the SparkPost service hosted
        # in
        #     North America. <code>eu</code> or <code>null</code> are the only valid values for <code>region</code>.
        #   </li>
        #   <li>
        # <code>mailgun</code> requires <code>api_key</code> and <code>domain</code>. Optionally, set
        # <code>region</code> to
        # <code>eu</code> to use the Mailgun service hosted in Europe; set to <code>null</code> otherwise.
        # <code>eu</code> or
        #     <code>null</code> are the only valid values for <code>region</code>.
        #   </li>
        # <li><code>ses</code> requires <code>accessKeyId</code>, <code>secretAccessKey</code>, and
        # <code>region</code></li>
        #   <li>
        #     <code>smtp</code> requires <code>smtp_host</code>, <code>smtp_port</code>, <code>smtp_user</code>, and
        #     <code>smtp_pass</code>
        #   </li>
        # </ul>
        # Depending on the type of provider it is possible to specify <code>settings</code> object with different
        # configuration
        # options, which will be used when sending an email:
        # <ul>
        #   <li>
        #     <code>smtp</code> provider, <code>settings</code> may contain <code>headers</code> object.
        #     <ul>
        #       <li>
        #         When using AWS SES SMTP host, you may provide a name of configuration set in
        #         <code>X-SES-Configuration-Set</code> header. Value must be a string.
        #       </li>
        #       <li>
        #         When using Sparkpost host, you may provide value for
        #         <code>X-MSYS_API</code> header. Value must be an object.
        #       </li>
        #     </ul>
        # for <code>ses</code> provider, <code>settings</code> may contain <code>message</code> object, where you can
        # provide
        #     a name of configuration set in <code>configuration_set_name</code> property. Value must be a string.
        #   </li>
        # </ul>
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
