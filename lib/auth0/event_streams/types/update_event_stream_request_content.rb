# frozen_string_literal: true

module Auth0
  module EventStreams
    module Types
      class UpdateEventStreamRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :subscriptions, -> { Internal::Types::Array[Auth0::Types::EventStreamSubscription] }, optional: true, nullable: false
        field :destination, -> { Auth0::Types::EventStreamDestinationPatch }, optional: true, nullable: false
        field :status, -> { Auth0::Types::EventStreamStatusEnum }, optional: true, nullable: false
      end
    end
  end
end
