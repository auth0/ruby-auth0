# frozen_string_literal: true

module Auth0
  module Types
    # The member that is a part of the group.
    class EventStreamCloudEventGroupMemberAddedObjectMember < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectMember0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectMember1 }
    end
  end
end
