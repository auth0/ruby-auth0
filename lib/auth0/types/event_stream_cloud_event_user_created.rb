# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for user.created.
    class EventStreamCloudEventUserCreated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventUserCreatedCloudEvent }, optional: false, nullable: false
    end
  end
end
