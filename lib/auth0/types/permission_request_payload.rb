# frozen_string_literal: true

module Auth0
  module Types
    class PermissionRequestPayload < Internal::Types::Model
      field :resource_server_identifier, -> { String }, optional: false, nullable: false
      field :permission_name, -> { String }, optional: false, nullable: false
    end
  end
end
