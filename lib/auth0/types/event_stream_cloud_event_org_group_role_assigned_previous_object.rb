# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgGroupRoleAssignedPreviousObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectOrganization }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectRole }, optional: false, nullable: false

      field :group, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectGroup }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
