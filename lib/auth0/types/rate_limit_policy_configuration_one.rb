# frozen_string_literal: true

module Auth0
  module Types
    class RateLimitPolicyConfigurationOne < Internal::Types::Model
      field :action, -> { Auth0::Types::RateLimitPolicyConfigurationOneAction }, optional: false, nullable: false

      field :limit, -> { Integer }, optional: false, nullable: false
    end
  end
end
