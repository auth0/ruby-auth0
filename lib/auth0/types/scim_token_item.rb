# frozen_string_literal: true

module Auth0
  module Types
    class SCIMTokenItem < Internal::Types::Model
      field :token_id, -> { String }, optional: true, nullable: false
      field :scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :valid_until, -> { String }, optional: true, nullable: false
      field :last_used_at, -> { String }, optional: true, nullable: false
    end
  end
end
