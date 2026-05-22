# frozen_string_literal: true

module Auth0
  module Types
    # Bad Request
    class BadRequestSchema < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false

      field :status_code, -> { String }, optional: false, nullable: false, api_name: "statusCode"

      field :error, -> { Auth0::Types::BadRequestSchemaError }, optional: false, nullable: false
    end
  end
end
