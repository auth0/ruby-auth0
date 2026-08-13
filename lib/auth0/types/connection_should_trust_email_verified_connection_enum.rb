# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionShouldTrustEmailVerifiedConnectionEnum
      extend Auth0::Internal::Types::Enum

      NEVER_SET_EMAILS_AS_VERIFIED = "never_set_emails_as_verified"
      ALWAYS_SET_EMAILS_AS_VERIFIED = "always_set_emails_as_verified"
    end
  end
end
