# frozen_string_literal: true

module Auth0
  module Types
    # Unauthorized
    class UnauthorizedSchema < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false

      field :status_code, -> { String }, optional: false, nullable: false, api_name: "statusCode"

      field :error, -> { Auth0::Types::UnauthorizedSchemaError }, optional: false, nullable: false
    end
  end
end
