# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.connection.removed.
    class EventStreamCloudEventOrgConnectionRemoved < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventOrgConnectionRemovedCloudEvent }, optional: false, nullable: false
    end
  end
end
