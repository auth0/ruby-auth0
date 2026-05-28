# frozen_string_literal: true

module Auth0
  module Types
    # The user that is a member of the organization.
    class EventStreamCloudEventOrgMemberRoleAssignedObjectUser < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false
    end
  end
end
