# frozen_string_literal: true

module Auth0
  module Types
    # The event payload.
    class EventStreamCloudEventUserDeletedData < Internal::Types::Model
      field :object, -> { Auth0::Types::EventStreamCloudEventUserDeletedObject }, optional: false, nullable: false

      field :previous_object, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObject }, optional: true, nullable: false

      field :context, -> { Auth0::Types::EventStreamCloudEventContext }, optional: true, nullable: false
    end
  end
end
