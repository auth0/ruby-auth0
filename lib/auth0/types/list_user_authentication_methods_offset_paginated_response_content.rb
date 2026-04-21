# frozen_string_literal: true

module Auth0
  module Types
    class ListUserAuthenticationMethodsOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :authenticators, -> { Internal::Types::Array[Auth0::Types::UserAuthenticationMethod] }, optional: true, nullable: false
    end
  end
end
