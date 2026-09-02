# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is assigned to.
    class EventStreamCloudEventGroupRoleDeletedPreviousObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedPreviousObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedPreviousObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedPreviousObjectGroup2 }
    end
  end
end
