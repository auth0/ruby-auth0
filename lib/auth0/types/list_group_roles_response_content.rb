# frozen_string_literal: true

module Auth0
  module Types
    class ListGroupRolesResponseContent < Internal::Types::Model
      field :roles, -> { Internal::Types::Array[Auth0::Types::Role] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
