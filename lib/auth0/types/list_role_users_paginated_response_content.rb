# frozen_string_literal: true

module Auth0
  module Types
    class ListRoleUsersPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :users, -> { Internal::Types::Array[Auth0::Types::RoleUser] }, optional: true, nullable: false
    end
  end
end
