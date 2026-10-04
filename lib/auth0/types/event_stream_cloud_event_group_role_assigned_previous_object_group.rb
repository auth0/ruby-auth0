# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is assigned to.
    class EventStreamCloudEventGroupRoleAssignedPreviousObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedPreviousObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedPreviousObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedPreviousObjectGroup2 }
    end
  end
end
