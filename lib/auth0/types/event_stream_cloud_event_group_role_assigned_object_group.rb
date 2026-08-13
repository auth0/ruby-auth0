# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is assigned to.
    class EventStreamCloudEventGroupRoleAssignedObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedObjectGroup2 }
    end
  end
end
