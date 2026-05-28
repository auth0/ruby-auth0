# frozen_string_literal: true

module Auth0
  module Types
    class UserEffectivePermissionRoleSourceResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :sources, -> { Internal::Types::Array[Auth0::Types::UserEffectivePermissionRoleSourceEnum] }, optional: true, nullable: false
    end
  end
end
