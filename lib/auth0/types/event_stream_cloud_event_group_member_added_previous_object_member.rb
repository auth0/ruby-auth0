# frozen_string_literal: true

module Auth0
  module Types
    # The member that is a part of the group.
    class EventStreamCloudEventGroupMemberAddedPreviousObjectMember < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedPreviousObjectMember0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedPreviousObjectMember1 }
    end
  end
end
