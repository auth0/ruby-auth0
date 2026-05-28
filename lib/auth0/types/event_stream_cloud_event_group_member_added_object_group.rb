# frozen_string_literal: true

module Auth0
  module Types
    # The group the member belongs to.
    class EventStreamCloudEventGroupMemberAddedObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectGroup2 }
    end
  end
end
