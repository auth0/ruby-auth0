# frozen_string_literal: true

module Auth0
  module Types
    class UsernameValidation < Internal::Types::Model
      field :min_length, -> { Integer }, optional: true, nullable: false
      field :max_length, -> { Integer }, optional: true, nullable: false
      field :allowed_types, -> { Auth0::Types::UsernameAllowedTypes }, optional: true, nullable: false
    end
  end
end
