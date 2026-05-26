# frozen_string_literal: true

module Auth0
  module Types
    class RateLimitPolicyConfigurationZero < Internal::Types::Model
      field :action, -> { Auth0::Types::RateLimitPolicyConfigurationZeroAction }, optional: false, nullable: false
    end
  end
end
