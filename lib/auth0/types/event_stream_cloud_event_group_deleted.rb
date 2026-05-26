# frozen_string_literal: true

module Auth0
  module Types
    # SSE message for group.deleted.
    class EventStreamCloudEventGroupDeleted < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false

      field :event, -> { Auth0::Types::EventStreamCloudEventGroupDeletedCloudEvent }, optional: false, nullable: false
    end
  end
end
