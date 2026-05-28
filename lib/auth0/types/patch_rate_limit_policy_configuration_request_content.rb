# frozen_string_literal: true

module Auth0
  module Types
    class PatchRateLimitPolicyConfigurationRequestContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::PatchRateLimitPolicyConfigurationRequestContentZero }

      member -> { Auth0::Types::PatchRateLimitPolicyConfigurationRequestContentOne }

      member -> { Auth0::Types::PatchRateLimitPolicyConfigurationRequestContentAction }
    end
  end
end
