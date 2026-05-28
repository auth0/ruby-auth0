# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.member.role.deleted.
    class EventStreamCloudEventOrgMemberRoleDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
