# frozen_string_literal: true

module Auth0
  module Types
    # Custom configuration for access tokens
    class ResourceServerAccessToken < Internal::Types::Model
      field :claims_mapping, -> { Auth0::Types::ResourceServerAccessTokenClaimsMapping }, optional: true, nullable: false
    end
  end
end
