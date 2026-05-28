# frozen_string_literal: true

module Auth0
  module Types
    class ListUserEffectivePermissionRoleSourcesResponseContent < Internal::Types::Model
      field :roles, -> { Internal::Types::Array[Auth0::Types::UserEffectivePermissionRoleSourceResponseContent] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
