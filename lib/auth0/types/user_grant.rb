# frozen_string_literal: true

module Auth0
  module Types
    class UserGrant < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false, api_name: "clientID"
      field :user_id, -> { String }, optional: true, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
