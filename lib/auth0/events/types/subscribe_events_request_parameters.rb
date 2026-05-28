# frozen_string_literal: true

module Auth0
  module Events
    module Types
      class SubscribeEventsRequestParameters < Internal::Types::Model
        field :from, -> { String }, optional: true, nullable: false

        field :from_timestamp, -> { String }, optional: true, nullable: false

        field :event_type, -> { Auth0::Types::EventStreamSubscribeEventsEventTypeEnum }, optional: true, nullable: false
      end
    end
  end
end
