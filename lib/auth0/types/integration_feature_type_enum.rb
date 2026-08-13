# frozen_string_literal: true

module Auth0
  module Types
    module IntegrationFeatureTypeEnum
      extend Auth0::Internal::Types::Enum

      UNSPECIFIED = "unspecified"
      ACTION = "action"
      SOCIAL_CONNECTION = "social_connection"
      LOG_STREAM = "log_stream"
      SSO_INTEGRATION = "sso_integration"
      SMS_PROVIDER = "sms_provider"
    end
  end
end
