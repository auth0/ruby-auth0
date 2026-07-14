# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for connection.created.
    class EventStreamCloudEventConnectionCreated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedCloudEvent }, optional: false, nullable: false
    end
  end
end
