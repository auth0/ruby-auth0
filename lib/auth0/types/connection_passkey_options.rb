# frozen_string_literal: true

module Auth0
  module Types
    # Options for the passkey authentication method
    class ConnectionPasskeyOptions < Internal::Types::Model
      field :challenge_ui, -> { Auth0::Types::ConnectionPasskeyChallengeUIEnum }, optional: true, nullable: false
      field :progressive_enrollment_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :local_enrollment_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
