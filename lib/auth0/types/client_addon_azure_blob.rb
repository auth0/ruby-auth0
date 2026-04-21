# frozen_string_literal: true

module Auth0
  module Types
    # Azure Blob Storage addon configuration.
    class ClientAddonAzureBlob < Internal::Types::Model
      field :account_name, -> { String }, optional: true, nullable: false, api_name: "accountName"
      field :storage_access_key, -> { String }, optional: true, nullable: false, api_name: "storageAccessKey"
      field :container_name, -> { String }, optional: true, nullable: false, api_name: "containerName"
      field :blob_name, -> { String }, optional: true, nullable: false, api_name: "blobName"
      field :expiration, -> { Integer }, optional: true, nullable: false
      field :signed_identifier, -> { String }, optional: true, nullable: false, api_name: "signedIdentifier"
      field :blob_read, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :blob_write, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :blob_delete, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :container_read, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :container_write, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :container_delete, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :container_list, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
