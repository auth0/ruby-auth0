# frozen_string_literal: true

module Auth0
  module Types
    class UserEffectivePermissionResponseContent < Internal::Types::Model
      field :resource_server_identifier, -> { String }, optional: true, nullable: false

      field :permission_name, -> { String }, optional: true, nullable: false

      field :resource_server_name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :sources, -> { Internal::Types::Array[Auth0::Types::UserEffectivePermissionSourceEnum] }, optional: true, nullable: false
    end
  end
end
