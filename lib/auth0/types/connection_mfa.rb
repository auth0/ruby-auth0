# frozen_string_literal: true

module Auth0
  module Types
    # Multi-factor authentication configuration
    class ConnectionMfa < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :return_enroll_settings, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
