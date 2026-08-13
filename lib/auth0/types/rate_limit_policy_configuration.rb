# frozen_string_literal: true

module Auth0
  module Types
    # The configuration of the rate limit policy.
    class RateLimitPolicyConfiguration < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::RateLimitPolicyConfigurationZero }

      member -> { Auth0::Types::RateLimitPolicyConfigurationOne }

      member -> { Auth0::Types::RateLimitPolicyConfigurationAction }
    end
  end
end
