# frozen_string_literal: true

module Auth0
  module Types
    # Azure Storage Bus addon configuration.
    class ClientAddonAzureSb < Internal::Types::Model
      field :namespace, -> { String }, optional: true, nullable: false
      field :sas_key_name, -> { String }, optional: true, nullable: false, api_name: "sasKeyName"
      field :sas_key, -> { String }, optional: true, nullable: false, api_name: "sasKey"
      field :entity_path, -> { String }, optional: true, nullable: false, api_name: "entityPath"
      field :expiration, -> { Integer }, optional: true, nullable: false
    end
  end
end
