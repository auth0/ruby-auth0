# frozen_string_literal: true

module Auth0
  module Types
    # The group the member belongs to.
    class EventStreamCloudEventGroupMemberDeletedPreviousObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedPreviousObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedPreviousObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedPreviousObjectGroup2 }
    end
  end
end
