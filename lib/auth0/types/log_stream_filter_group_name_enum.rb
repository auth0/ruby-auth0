# frozen_string_literal: true

module Auth0
  module Types
    module LogStreamFilterGroupNameEnum
      extend Auth0::Internal::Types::Enum

      AUTH_LOGIN_FAIL = "auth.login.fail"
      AUTH_LOGIN_NOTIFICATION = "auth.login.notification"
      AUTH_LOGIN_SUCCESS = "auth.login.success"
      AUTH_LOGOUT_FAIL = "auth.logout.fail"
      AUTH_LOGOUT_SUCCESS = "auth.logout.success"
      AUTH_SIGNUP_FAIL = "auth.signup.fail"
      AUTH_SIGNUP_SUCCESS = "auth.signup.success"
      AUTH_SILENT_AUTH_FAIL = "auth.silent_auth.fail"
      AUTH_SILENT_AUTH_SUCCESS = "auth.silent_auth.success"
      AUTH_TOKEN_EXCHANGE_FAIL = "auth.token_exchange.fail"
      AUTH_TOKEN_EXCHANGE_SUCCESS = "auth.token_exchange.success"
      MANAGEMENT_FAIL = "management.fail"
      MANAGEMENT_SUCCESS = "management.success"
      SCIM_EVENT = "scim.event"
      SYSTEM_NOTIFICATION = "system.notification"
      USER_FAIL = "user.fail"
      USER_NOTIFICATION = "user.notification"
      USER_SUCCESS = "user.success"
      ACTIONS = "actions"
      OTHER = "other"
    end
  end
end
