# frozen_string_literal: true

module Auth0
  module Types
    # Settings for SAML assertion decryption.
    class EventStreamCloudEventConnectionDeletedObject2OptionsAssertionDecryptionSettings < Internal::Types::Model
      field :algorithm_exceptions, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :algorithm_profile, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject2OptionsAssertionDecryptionSettingsAlgorithmProfileEnum }, optional: false, nullable: false
    end
  end
end
