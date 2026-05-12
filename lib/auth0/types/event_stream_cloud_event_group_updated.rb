# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for group.updated.
    class EventStreamCloudEventGroupUpdated < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEventGroupUpdatedCloudEvent }, optional: false, nullable: false
    end
  end
end
