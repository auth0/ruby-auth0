# frozen_string_literal: true

module Auth0
  module Types
    # Whether matched clients default to requiring proof of possession.
    class ClientProfileClientConfigurationRequireProofOfPossession < Internal::Types::Model
      field :default_value, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
