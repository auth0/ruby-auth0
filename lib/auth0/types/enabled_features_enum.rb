# frozen_string_literal: true

module Auth0
  module Types
    module EnabledFeaturesEnum
      extend Auth0::Internal::Types::Enum

      SCIM = "scim"
      UNIVERSAL_LOGOUT = "universal_logout"
    end
  end
end
