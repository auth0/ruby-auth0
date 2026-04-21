# frozen_string_literal: true

module Auth0
  module Types
    class ConnectedAccount < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :connection, -> { String }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: false, nullable: false
      field :strategy, -> { String }, optional: false, nullable: false
      field :access_type, -> { Auth0::Types::ConnectedAccountAccessTypeEnum }, optional: false, nullable: false
      field :scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
      field :organization_id, -> { String }, optional: true, nullable: false
    end
  end
end
