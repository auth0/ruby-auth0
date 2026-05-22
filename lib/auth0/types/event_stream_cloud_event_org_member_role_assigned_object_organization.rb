# frozen_string_literal: true

module Auth0
  module Types
    # The organization the member belongs to.
    class EventStreamCloudEventOrgMemberRoleAssignedObjectOrganization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
