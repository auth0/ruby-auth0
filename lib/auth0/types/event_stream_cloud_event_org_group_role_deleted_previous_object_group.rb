# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is assigned to.
    class EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectGroup2 }
    end
  end
end
