# frozen_string_literal: true

module Auth0
  module Types
    class RotateSigningKeysResponseContent < Internal::Types::Model
      field :cert, -> { String }, optional: false, nullable: false
      field :kid, -> { String }, optional: false, nullable: false
    end
  end
end
