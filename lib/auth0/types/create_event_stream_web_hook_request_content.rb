# frozen_string_literal: true

module Auth0
  module Types
    class CreateEventStreamWebHookRequestContent < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :subscriptions, -> { Internal::Types::Array[Auth0::Types::EventStreamSubscription] }, optional: true, nullable: false
      field :destination, -> { Auth0::Types::EventStreamWebhookDestination }, optional: false, nullable: false
      field :status, -> { Auth0::Types::EventStreamStatusEnum }, optional: true, nullable: false
    end
  end
end
