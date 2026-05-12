# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.member.deleted.
    class EventStreamCloudEventOrgMemberDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventOrgMemberDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
