# frozen_string_literal: true

module Auth0
  module Types
    class UsernameAllowedTypes < Internal::Types::Model
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :phone_number, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
