# frozen_string_literal: true

module Auth0
  module Types
    class ListUserEffectivePermissionsResponseContent < Internal::Types::Model
      field :permissions, -> { Internal::Types::Array[Auth0::Types::UserEffectivePermissionResponseContent] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
