# frozen_string_literal: true

module Auth0
  module Users
    module EffectivePermissions
      module Sources
        module Roles
          module Types
            class ListUserEffectivePermissionRoleSourceRequestParameters < Internal::Types::Model
              field :id, -> { String }, optional: false, nullable: false

              field :from, -> { String }, optional: true, nullable: false

              field :take, -> { Integer }, optional: true, nullable: false

              field :resource_server_identifier, -> { String }, optional: false, nullable: false

              field :permission_name, -> { String }, optional: false, nullable: false
            end
          end
        end
      end
    end
  end
end
