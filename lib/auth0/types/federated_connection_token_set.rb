# frozen_string_literal: true

module Auth0
  module Types
    class FederatedConnectionTokenSet < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :connection, -> { String }, optional: true, nullable: false
      field :scope, -> { String }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
      field :issued_at, -> { String }, optional: true, nullable: false
      field :last_used_at, -> { String }, optional: true, nullable: false
    end
  end
end
