# frozen_string_literal: true

module Auth0
  module Types
    # The role assigned to the group in the organization.
    class EventStreamCloudEventOrgGroupRoleAssignedObjectRole < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
