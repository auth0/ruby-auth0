# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaAPIKey < Internal::Types::Model
      field :api_key, -> { String }, optional: true, nullable: false
      field :domain, -> { String }, optional: true, nullable: false
      field :region, -> { Auth0::Types::EmailMailgunRegionEnum }, optional: true, nullable: false
    end
  end
end
