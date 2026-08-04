# frozen_string_literal: true

module Auth0
  module Types
    # Checkpoint paginated list of groups assigned to a role within an organization.
    class ListOrganizationRoleGroupsResponseContent < Internal::Types::Model
      field :groups, -> { Internal::Types::Array[Auth0::Types::RoleGroup] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
