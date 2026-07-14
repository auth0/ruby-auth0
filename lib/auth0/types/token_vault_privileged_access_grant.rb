# frozen_string_literal: true

module Auth0
  module Types
    class TokenVaultPrivilegedAccessGrant < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false

      field :scopes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
