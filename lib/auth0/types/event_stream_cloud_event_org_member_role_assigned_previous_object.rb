# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgMemberRoleAssignedPreviousObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedPreviousObjectOrganization }, optional: false, nullable: false

      field :user, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedPreviousObjectUser }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedPreviousObjectRole }, optional: false, nullable: false
    end
  end
end
