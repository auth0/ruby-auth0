# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for group.created.
    class EventStreamCloudEventGroupCreated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventGroupCreatedCloudEvent }, optional: false, nullable: false
    end
  end
end
