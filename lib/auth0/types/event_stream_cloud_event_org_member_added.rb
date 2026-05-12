# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.member.added.
    class EventStreamCloudEventOrgMemberAdded < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventOrgMemberAddedCloudEvent }, optional: false, nullable: false
    end
  end
end
