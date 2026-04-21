# frozen_string_literal: true

module Auth0
  module Types
    class RefreshTokenResourceServer < Internal::Types::Model
      field :audience, -> { String }, optional: true, nullable: false
      field :scopes, -> { String }, optional: true, nullable: false
    end
  end
end
