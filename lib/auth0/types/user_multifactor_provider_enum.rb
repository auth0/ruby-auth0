# frozen_string_literal: true

module Auth0
  module Types
    module UserMultifactorProviderEnum
      extend Auth0::Internal::Types::Enum

      DUO = "duo"
      GOOGLE_AUTHENTICATOR = "google-authenticator"
    end
  end
end
