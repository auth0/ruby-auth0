# frozen_string_literal: true

module Auth0
  module Types
    class UserAuthenticationMethodProperties < Internal::Types::Model
      field :type, -> { Auth0::Types::UserAuthenticationMethodPropertiesEnum }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
    end
  end
end
