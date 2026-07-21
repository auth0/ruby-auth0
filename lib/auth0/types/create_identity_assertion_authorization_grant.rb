# frozen_string_literal: true

module Auth0
  module Types
    # Configuration on the use of ID-JAGs for Cross App Access.
    class CreateIdentityAssertionAuthorizationGrant < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
