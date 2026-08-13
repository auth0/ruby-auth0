# frozen_string_literal: true

module Auth0
  module Types
    # Options for validation
    class ConnectionValidationOptions < Internal::Types::Model
      field :username, -> { Auth0::Types::ConnectionUsernameValidationOptions }, optional: true, nullable: false
    end
  end
end
