# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgMemberRoleAssignedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedObjectOrganization }, optional: false, nullable: false
      field :user, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedObjectUser }, optional: false, nullable: false
      field :role, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedObjectRole }, optional: false, nullable: false
    end
  end
end
