# frozen_string_literal: true

module Auth0
  module EventStreams
    module Types
      class CreateEventStreamTestEventRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :event_type, -> { Auth0::Types::EventStreamTestEventTypeEnum }, optional: false, nullable: false
        field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end
