# frozen_string_literal: true

module Auth0
  module Types
    class CreateSCIMTokenResponseContent < Internal::Types::Model
      field :token_id, -> { String }, optional: true, nullable: false
      field :token, -> { String }, optional: true, nullable: false
      field :scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :valid_until, -> { String }, optional: true, nullable: false
    end
  end
end
