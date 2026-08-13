# frozen_string_literal: true

module Auth0
  module Types
    module ClientRedirectionPolicyEnum
      extend Auth0::Internal::Types::Enum

      ALLOW_ALWAYS = "allow_always"
      OPEN_REDIRECT_PROTECTION = "open_redirect_protection"
    end
  end
end
