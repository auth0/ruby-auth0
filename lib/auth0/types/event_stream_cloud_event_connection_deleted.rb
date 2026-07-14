# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for connection.deleted.
    class EventStreamCloudEventConnectionDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
