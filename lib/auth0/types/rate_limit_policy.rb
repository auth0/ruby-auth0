# frozen_string_literal: true

module Auth0
  module Types
    class RateLimitPolicy < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :resource, -> { Auth0::Types::RateLimitPolicyResourceEnum }, optional: false, nullable: false

      field :consumer, -> { Auth0::Types::RateLimitPolicyConsumerEnum }, optional: false, nullable: false

      field :consumer_selector, -> { String }, optional: false, nullable: false

      field :configuration, -> { Auth0::Types::RateLimitPolicyConfiguration }, optional: false, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
