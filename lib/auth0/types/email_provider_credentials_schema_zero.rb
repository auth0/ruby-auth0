# frozen_string_literal: true

module Auth0
  module Types
    class EmailProviderCredentialsSchemaZero < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false
    end
  end
end
