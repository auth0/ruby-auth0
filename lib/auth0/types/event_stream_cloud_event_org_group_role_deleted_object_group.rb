# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is removed from.
    class EventStreamCloudEventOrgGroupRoleDeletedObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedObjectGroup2 }
    end
  end
end
