# frozen_string_literal: true

module Auth0
  module Types
    class PatchRateLimitPolicyConfigurationRequestContentZero < Internal::Types::Model
      field :action, -> { Auth0::Types::PatchRateLimitPolicyConfigurationRequestContentZeroAction }, optional: false, nullable: false
    end
  end
end
