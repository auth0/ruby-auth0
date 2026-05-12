# frozen_string_literal: true

module Auth0
  module Types
    # Settings for SAML assertion decryption.
    class ConnectionAssertionDecryptionSettings < Internal::Types::Model
      field :algorithm_profile, -> { Auth0::Types::ConnectionAssertionDecryptionAlgorithmProfileEnum }, optional: false, nullable: false
      field :algorithm_exceptions, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
