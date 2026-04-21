# frozen_string_literal: true

module Auth0
  module Types
    # Encryption used for WsFed responses with this client.
    class ClientEncryptionKey < Internal::Types::Model
      field :pub, -> { String }, optional: true, nullable: false
      field :cert, -> { String }, optional: true, nullable: false
      field :subject, -> { String }, optional: true, nullable: false
    end
  end
end
