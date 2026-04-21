# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaClientID < Internal::Types::Model
      field :tenant_id, -> { String }, optional: true, nullable: false, api_name: "tenantId"
      field :client_id, -> { String }, optional: true, nullable: false, api_name: "clientId"
      field :client_secret, -> { String }, optional: true, nullable: false, api_name: "clientSecret"
    end
  end
end
