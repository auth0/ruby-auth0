# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionUsernameValidationOptions < Internal::Types::Model
      field :min, -> { Integer }, optional: false, nullable: false
      field :max, -> { Integer }, optional: false, nullable: false
    end
  end
end
