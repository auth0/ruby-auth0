# frozen_string_literal: true

module Auth0
  module Types
    # Custom configuration for claims in access tokens
    class ResourceServerAccessTokenClaimsMapping < Internal::Types::Model
      field :custom_claims, -> { Internal::Types::Array[Auth0::Types::ResourceServerAccessTokenCustomClaimsMappingRule] }, optional: true, nullable: false
    end
  end
end
