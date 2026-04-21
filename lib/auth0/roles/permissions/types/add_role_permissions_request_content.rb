# frozen_string_literal: true

module Auth0
  module Roles
    module Permissions
      module Types
        class AddRolePermissionsRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :permissions, -> { Internal::Types::Array[Auth0::Types::PermissionRequestPayload] }, optional: false, nullable: false
        end
      end
    end
  end
end
