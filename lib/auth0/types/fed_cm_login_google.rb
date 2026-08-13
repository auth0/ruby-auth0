# frozen_string_literal: true

module Auth0
  module Types
    # Google FedCM configuration for this client
    class FedCmLoginGoogle < Internal::Types::Model
      field :is_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
