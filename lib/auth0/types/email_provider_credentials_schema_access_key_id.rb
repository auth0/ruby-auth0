# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaAccessKeyID < Internal::Types::Model
      field :access_key_id, -> { String }, optional: true, nullable: false, api_name: "accessKeyId"
      field :secret_access_key, -> { String }, optional: true, nullable: false, api_name: "secretAccessKey"
      field :region, -> { String }, optional: true, nullable: false
    end
  end
end
