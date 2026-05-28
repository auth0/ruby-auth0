# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for user.deleted.
    class EventStreamCloudEventUserDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventUserDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
