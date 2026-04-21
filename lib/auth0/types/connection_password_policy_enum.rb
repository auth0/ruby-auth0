# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionPasswordPolicyEnum
      extend Auth0::Internal::Types::Enum

      NONE = "none"
      LOW = "low"
      FAIR = "fair"
      GOOD = "good"
      EXCELLENT = "excellent"
    end
  end
end
