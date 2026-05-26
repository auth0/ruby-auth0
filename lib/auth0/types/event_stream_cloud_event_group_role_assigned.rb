# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for group.role.assigned.
    class EventStreamCloudEventGroupRoleAssigned < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedCloudEvent }, optional: false, nullable: false
    end
  end
end
