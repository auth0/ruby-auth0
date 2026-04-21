# frozen_string_literal: true

module Auth0
  module Types
    # Layer addon configuration.
    class ClientAddonLayer < Internal::Types::Model
      field :provider_id, -> { String }, optional: false, nullable: false, api_name: "providerId"
      field :key_id, -> { String }, optional: false, nullable: false, api_name: "keyId"
      field :private_key, -> { String }, optional: false, nullable: false, api_name: "privateKey"
      field :principal, -> { String }, optional: true, nullable: false
      field :expiration, -> { Integer }, optional: true, nullable: false
    end
  end
end
