# frozen_string_literal: true

module Auth0
  module Types
    class NotFoundErrorBody < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false

      field :status_code, -> { String }, optional: false, nullable: false, api_name: "statusCode"

      field :error, -> { Auth0::Types::NotFoundErrorBodyError }, optional: false, nullable: false
    end
  end
end
