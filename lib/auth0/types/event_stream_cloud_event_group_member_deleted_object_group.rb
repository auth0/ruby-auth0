# frozen_string_literal: true

module Auth0
  module Types
    # The group the member belongs to.
    class EventStreamCloudEventGroupMemberDeletedObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectGroup2 }
    end
  end
end
