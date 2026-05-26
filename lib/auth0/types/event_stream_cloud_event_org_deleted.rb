# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.deleted.
    class EventStreamCloudEventOrgDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventOrgDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
