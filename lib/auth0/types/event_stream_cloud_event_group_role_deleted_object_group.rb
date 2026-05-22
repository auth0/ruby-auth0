# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is removed from.
    class EventStreamCloudEventGroupRoleDeletedObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedObjectGroup2 }
    end
  end
end
