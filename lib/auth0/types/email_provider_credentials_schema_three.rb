# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaThree < Internal::Types::Model
      field :api_key, -> { String }, optional: true, nullable: false
      field :region, -> { Auth0::Types::EmailSparkPostRegionEnum }, optional: true, nullable: false
    end
  end
end
