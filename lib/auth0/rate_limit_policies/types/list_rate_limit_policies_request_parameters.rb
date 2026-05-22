# frozen_string_literal: true

module Auth0
  module RateLimitPolicies
    module Types
      class ListRateLimitPoliciesRequestParameters < Internal::Types::Model
        field :resource, -> { Auth0::Types::RateLimitPolicyResourceEnum }, optional: true, nullable: false

        field :consumer, -> { Auth0::Types::RateLimitPolicyConsumerEnum }, optional: true, nullable: false

        field :consumer_selector, -> { String }, optional: true, nullable: false

        field :take, -> { Integer }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false
      end
    end
  end
end
