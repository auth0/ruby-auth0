# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionKey < Internal::Types::Model
      field :kid, -> { String }, optional: false, nullable: false
      field :cert, -> { String }, optional: false, nullable: false
      field :pkcs, -> { String }, optional: true, nullable: false
      field :current, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :next_, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "next"
      field :previous, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :current_since, -> { String }, optional: true, nullable: false
      field :fingerprint, -> { String }, optional: false, nullable: false
      field :thumbprint, -> { String }, optional: false, nullable: false
      field :algorithm, -> { String }, optional: true, nullable: false
      field :key_use, -> { Auth0::Types::ConnectionKeyUseEnum }, optional: true, nullable: false
      field :subject_dn, -> { String }, optional: true, nullable: false
    end
  end
end
