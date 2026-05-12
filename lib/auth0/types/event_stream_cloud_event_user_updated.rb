# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for user.updated.
    class EventStreamCloudEventUserUpdated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventUserUpdatedCloudEvent }, optional: false, nullable: false
    end
  end
end
