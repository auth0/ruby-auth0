# frozen_string_literal: true

module Auth0
  module Types
    # The member that is a part of the group.
    class EventStreamCloudEventGroupMemberDeletedObjectMember < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectMember0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectMember1 }
    end
  end
end
