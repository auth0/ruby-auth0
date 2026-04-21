# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module PushNotification
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve configuration details for the multi-factor authentication APNS provider associated with your
          # tenant.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderApnsResponseContent]
          def get_apns_provider(request_options: {}, **params)
            Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/push-notification/providers/apns",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetGuardianFactorsProviderApnsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Overwrite all configuration details of the multi-factor authentication APNS provider associated with your
          # tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationApnsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderPushNotificationApnsResponseContent]
          def set_apns_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/push-notification/providers/apns",
              body: Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationApnsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderPushNotificationApnsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Modify configuration details of the multi-factor authentication APNS provider associated with your tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationApnsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::UpdateGuardianFactorsProviderPushNotificationApnsResponseContent]
          def update_apns_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "guardian/factors/push-notification/providers/apns",
              body: Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationApnsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::UpdateGuardianFactorsProviderPushNotificationApnsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Overwrite all configuration details of the multi-factor authentication FCM provider associated with your
          # tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationFcmRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Hash[String, Object]]
          def set_fcm_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/push-notification/providers/fcm",
              body: Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationFcmRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderPushNotificationFcmResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Modify configuration details of the multi-factor authentication FCM provider associated with your tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationFcmRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Hash[String, Object]]
          def update_fcm_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "guardian/factors/push-notification/providers/fcm",
              body: Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationFcmRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::UpdateGuardianFactorsProviderPushNotificationFcmResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Overwrite all configuration details of the multi-factor authentication FCMV1 provider associated with your
          # tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationFcmv1RequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Hash[String, Object]]
          def set_fcmv1provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/push-notification/providers/fcmv1",
              body: Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationFcmv1RequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderPushNotificationFcmv1ResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Modify configuration details of the multi-factor authentication FCMV1 provider associated with your tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationFcmv1RequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Hash[String, Object]]
          def update_fcmv1provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "guardian/factors/push-notification/providers/fcmv1",
              body: Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationFcmv1RequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::UpdateGuardianFactorsProviderPushNotificationFcmv1ResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieve configuration details for an AWS SNS push notification provider that has been enabled for MFA. To
          # learn more, review <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-push-notifications-for-mfa">Configure
          # Push Notifications for MFA</a>.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderSnsResponseContent]
          def get_sns_provider(request_options: {}, **params)
            Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/push-notification/providers/sns",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetGuardianFactorsProviderSnsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Configure the <a href="https://auth0.com/docs/multifactor-authentication/developer/sns-configuration">AWS
          # SNS push notification provider configuration</a> (subscription required).
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationSnsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderPushNotificationSnsResponseContent]
          def set_sns_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/push-notification/providers/sns",
              body: Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationSnsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderPushNotificationSnsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Configure the <a href="https://auth0.com/docs/multifactor-authentication/developer/sns-configuration">AWS
          # SNS push notification provider configuration</a> (subscription required).
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationSnsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::UpdateGuardianFactorsProviderPushNotificationSnsResponseContent]
          def update_sns_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "guardian/factors/push-notification/providers/sns",
              body: Auth0::Guardian::Factors::PushNotification::Types::UpdateGuardianFactorsProviderPushNotificationSnsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::UpdateGuardianFactorsProviderPushNotificationSnsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Modify the push notification provider configured for your tenant. For more information, review <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-push-notifications-for-mfa">Configure
          # Push Notifications for MFA</a>.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderPushNotificationResponseContent]
          def get_selected_provider(request_options: {}, **params)
            Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/push-notification/selected-provider",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetGuardianFactorsProviderPushNotificationResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Modify the push notification provider configured for your tenant. For more information, review <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-push-notifications-for-mfa">Configure
          # Push Notifications for MFA</a>.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderPushNotificationResponseContent]
          def set_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/push-notification/selected-provider",
              body: Auth0::Guardian::Factors::PushNotification::Types::SetGuardianFactorsProviderPushNotificationRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderPushNotificationResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
