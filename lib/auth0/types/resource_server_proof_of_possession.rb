# frozen_string_literal: true

module Auth0
  module Types
    # Proof-of-Possession configuration for access tokens
    class ResourceServerProofOfPossession < Internal::Types::Model
      field :mechanism, -> { Auth0::Types::ResourceServerProofOfPossessionMechanismEnum }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :required_for, -> { Auth0::Types::ResourceServerProofOfPossessionRequiredForEnum }, optional: true, nullable: false
    end
  end
end
