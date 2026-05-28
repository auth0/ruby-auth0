# frozen_string_literal: true

module Auth0
  module RateLimitPolicies
    module Types
      class CreateRateLimitPolicyRequestContent < Internal::Types::Model
        field :resource, -> { Auth0::Types::RateLimitPolicyResourceEnum }, optional: false, nullable: false

        field :consumer, -> { Auth0::Types::RateLimitPolicyConsumerEnum }, optional: false, nullable: false

        field :consumer_selector, -> { String }, optional: false, nullable: false

        field :configuration, -> { Auth0::Types::RateLimitPolicyConfiguration }, optional: false, nullable: false
      end
    end
  end
end
