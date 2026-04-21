# frozen_string_literal: true

module Auth0
  module Users
    module Permissions
      module Types
        class CreateUserPermissionsRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :permissions, -> { Internal::Types::Array[Auth0::Types::PermissionRequestPayload] }, optional: false, nullable: false
        end
      end
    end
  end
end
