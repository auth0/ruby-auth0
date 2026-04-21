# frozen_string_literal: true

module Auth0
  module Types
    module HookTriggerIDEnum
      extend Auth0::Internal::Types::Enum

      CREDENTIALS_EXCHANGE = "credentials-exchange"
      PRE_USER_REGISTRATION = "pre-user-registration"
      POST_USER_REGISTRATION = "post-user-registration"
      POST_CHANGE_PASSWORD = "post-change-password"
      SEND_PHONE_MESSAGE = "send-phone-message"
    end
  end
end
