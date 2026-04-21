# frozen_string_literal: true

module Auth0
  module Types
    # Passkey authentication enablement
    class ConnectionPasskeyAuthenticationMethod < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
