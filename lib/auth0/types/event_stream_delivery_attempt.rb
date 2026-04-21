# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamDeliveryAttempt < Internal::Types::Model
      field :status, -> { Auth0::Types::EventStreamDeliveryStatusEnum }, optional: false, nullable: false
      field :timestamp, -> { String }, optional: false, nullable: false
      field :error_message, -> { String }, optional: true, nullable: false
    end
  end
end
