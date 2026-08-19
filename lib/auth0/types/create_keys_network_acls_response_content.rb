# frozen_string_literal: true

module Auth0
  module Types
    class CreateKeysNetworkACLsResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :alg, -> { Auth0::Types::NetworkACLKeyAlgorithmEnum }, optional: false, nullable: false

      field :fingerprint, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end
