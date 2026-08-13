# frozen_string_literal: true

module Auth0
  module Types
    module ClientOidcBackchannelLogoutInitiatorsEnum
      extend Auth0::Internal::Types::Enum

      RP_LOGOUT = "rp-logout"
      IDP_LOGOUT = "idp-logout"
      PASSWORD_CHANGED = "password-changed"
      SESSION_EXPIRED = "session-expired"
      SESSION_REVOKED = "session-revoked"
      ACCOUNT_DELETED = "account-deleted"
      EMAIL_IDENTIFIER_CHANGED = "email-identifier-changed"
      MFA_PHONE_UNENROLLED = "mfa-phone-unenrolled"
      ACCOUNT_DEACTIVATED = "account-deactivated"
    end
  end
end
