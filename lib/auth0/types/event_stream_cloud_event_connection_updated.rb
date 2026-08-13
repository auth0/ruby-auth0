# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for connection.updated.
    class EventStreamCloudEventConnectionUpdated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedCloudEvent }, optional: false, nullable: false
    end
  end
end
