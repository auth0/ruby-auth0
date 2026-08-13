# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgGroupRoleAssignedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedObjectOrganization }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedObjectRole }, optional: false, nullable: false

      field :group, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedObjectGroup }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
