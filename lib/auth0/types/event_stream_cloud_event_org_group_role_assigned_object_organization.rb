# frozen_string_literal: true

module Auth0
  module Types
    # The organization the group role is assigned in.
    class EventStreamCloudEventOrgGroupRoleAssignedObjectOrganization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
