# frozen_string_literal: true

module Auth0
  module Types
    # Configuration specific to a webhook destination.
    class EventStreamWebhookConfiguration < Internal::Types::Model
      field :webhook_endpoint, -> { String }, optional: false, nullable: false
      field :webhook_authorization, -> { Auth0::Types::EventStreamWebhookAuthorizationResponse }, optional: false, nullable: false
    end
  end
end
