# frozen_string_literal: true

module Auth0
  module Types
    class ClientRefreshTokenPolicy < Internal::Types::Model
      field :audience, -> { String }, optional: false, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
