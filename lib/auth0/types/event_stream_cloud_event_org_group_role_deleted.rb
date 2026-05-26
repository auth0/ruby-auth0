# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.group.role.deleted.
    class EventStreamCloudEventOrgGroupRoleDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
