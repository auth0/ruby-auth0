# frozen_string_literal: true

module Auth0
  module Types
    # Password history policy configuration to prevent password reuse
    class ConnectionPasswordOptionsHistory < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :size, -> { Integer }, optional: true, nullable: false
    end
  end
end
