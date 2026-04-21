# frozen_string_literal: true

module Auth0
  module Types
    # Metadata about a specific attempt to deliver an event
    class EventStreamDelivery < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :event_stream_id, -> { String }, optional: false, nullable: false
      field :status, -> { Auth0::Types::EventStreamDeliveryStatusEnum }, optional: false, nullable: false
      field :event_type, -> { Auth0::Types::EventStreamDeliveryEventTypeEnum }, optional: false, nullable: false
      field :attempts, -> { Internal::Types::Array[Auth0::Types::EventStreamDeliveryAttempt] }, optional: false, nullable: false
      field :event, -> { Auth0::Types::EventStreamCloudEvent }, optional: true, nullable: false
    end
  end
end
