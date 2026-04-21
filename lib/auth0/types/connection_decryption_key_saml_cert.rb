# frozen_string_literal: true

module Auth0
  module Types
    # Key pair with 'key' and 'cert' properties.
    class ConnectionDecryptionKeySAMLCert < Internal::Types::Model
      field :cert, -> { String }, optional: true, nullable: false
      field :key, -> { String }, optional: true, nullable: false
    end
  end
end
