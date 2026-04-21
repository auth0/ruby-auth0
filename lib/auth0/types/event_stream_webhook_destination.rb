# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamWebhookDestination < Internal::Types::Model
      field :type, -> { Auth0::Types::EventStreamWebhookDestinationTypeEnum }, optional: false, nullable: false
      field :configuration, -> { Auth0::Types::EventStreamWebhookConfiguration }, optional: false, nullable: false
    end
  end
end
