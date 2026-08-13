# frozen_string_literal: true

module Auth0
  module Types
    module CspPolicyMode
      extend Auth0::Internal::Types::Enum

      ENFORCING = "enforcing"
      REPORTING = "reporting"
    end
  end
end
