# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for organization.connection.updated.
    class EventStreamCloudEventOrgConnectionUpdated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedCloudEvent }, optional: false, nullable: false
    end
  end
end
