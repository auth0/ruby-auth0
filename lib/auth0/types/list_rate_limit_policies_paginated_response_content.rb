# frozen_string_literal: true

module Auth0
  module Types
    class ListRateLimitPoliciesPaginatedResponseContent < Internal::Types::Model
      field :rate_limit_policies, -> { Internal::Types::Array[Auth0::Types::RateLimitPolicy] }, optional: true, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
