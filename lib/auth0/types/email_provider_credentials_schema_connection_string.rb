# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaConnectionString < Internal::Types::Model
      field :connection_string, -> { String }, optional: true, nullable: false, api_name: "connectionString"
    end
  end
end
