# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamWebhookResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :subscriptions, -> { Internal::Types::Array[Auth0::Types::EventStreamSubscription] }, optional: true, nullable: false
      field :destination, -> { Auth0::Types::EventStreamWebhookDestination }, optional: true, nullable: false
      field :status, -> { Auth0::Types::EventStreamStatusEnum }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
