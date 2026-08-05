# frozen_string_literal: true

module Auth0
  module Types
    # Conflict
    class ConflictSchema < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false

      field :status_code, -> { String }, optional: false, nullable: false, api_name: "statusCode"

      field :error, -> { Auth0::Types::ConflictSchemaError }, optional: false, nullable: false
    end
  end
end
