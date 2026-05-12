# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for group.member.added.
    class EventStreamCloudEventGroupMemberAdded < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedCloudEvent }, optional: false, nullable: false
    end
  end
end
