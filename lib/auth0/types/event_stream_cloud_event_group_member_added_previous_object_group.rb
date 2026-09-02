# frozen_string_literal: true

module Auth0
  module Types
    # The group the member belongs to.
    class EventStreamCloudEventGroupMemberAddedPreviousObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedPreviousObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedPreviousObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedPreviousObjectGroup2 }
    end
  end
end
