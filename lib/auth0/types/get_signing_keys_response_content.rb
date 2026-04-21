# frozen_string_literal: true

module Auth0
  module Types
    class GetSigningKeysResponseContent < Internal::Types::Model
      field :kid, -> { String }, optional: false, nullable: false
      field :cert, -> { String }, optional: false, nullable: false
      field :pkcs7, -> { String }, optional: true, nullable: false
      field :current, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :next_, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "next"
      field :previous, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :current_since, -> { Auth0::Types::SigningKeysDate }, optional: true, nullable: false
      field :current_until, -> { Auth0::Types::SigningKeysDate }, optional: true, nullable: false
      field :fingerprint, -> { String }, optional: false, nullable: false
      field :thumbprint, -> { String }, optional: false, nullable: false
      field :revoked, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :revoked_at, -> { Auth0::Types::SigningKeysDate }, optional: true, nullable: false
    end
  end
end
