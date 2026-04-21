# frozen_string_literal: true

module Auth0
  module Types
    # Attribute configuration
    class ConnectionAttributes < Internal::Types::Model
      field :email, -> { Auth0::Types::EmailAttribute }, optional: true, nullable: false
      field :phone_number, -> { Auth0::Types::PhoneAttribute }, optional: true, nullable: false
      field :username, -> { Auth0::Types::UsernameAttribute }, optional: true, nullable: false
    end
  end
end
