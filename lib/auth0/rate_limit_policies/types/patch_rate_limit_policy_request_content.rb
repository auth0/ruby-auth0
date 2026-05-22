# frozen_string_literal: true

module Auth0
  module RateLimitPolicies
    module Types
      class PatchRateLimitPolicyRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :configuration, -> { Auth0::Types::PatchRateLimitPolicyConfigurationRequestContent }, optional: false, nullable: false
      end
    end
  end
end
