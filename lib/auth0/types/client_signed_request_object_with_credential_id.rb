# frozen_string_literal: true

module Auth0
  module Types
    # JWT-secured Authorization Requests (JAR) settings.
    class ClientSignedRequestObjectWithCredentialID < Internal::Types::Model
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :credentials, -> { Internal::Types::Array[Auth0::Types::CredentialID] }, optional: true, nullable: false
    end
  end
end
