# frozen_string_literal: true

module Auth0
  module EventStreams
    module Redeliveries
      module Types
        class CreateEventStreamRedeliveryRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :date_from, -> { String }, optional: true, nullable: false
          field :date_to, -> { String }, optional: true, nullable: false
          field :statuses, -> { Internal::Types::Array[Auth0::Types::EventStreamDeliveryStatusEnum] }, optional: true, nullable: false
          field :event_types, -> { Internal::Types::Array[Auth0::Types::EventStreamEventTypeEnum] }, optional: true, nullable: false
        end
      end
    end
  end
end
