# frozen_string_literal: true

module Auth0
  module Organizations
    module Groups
      module Roles
        module Types
          class DeleteOrganizationGroupRolesRequestContent < Internal::Types::Model
            field :organization_id, -> { String }, optional: false, nullable: false

            field :group_id, -> { String }, optional: false, nullable: false

            field :roles, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
