# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamWebhookAuthorizationResponse < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamWebhookBasicAuth }
      member -> { Auth0::Types::EventStreamWebhookBearerAuth }
      member -> { Auth0::Types::EventStreamWebhookCustomHeaderAuth }
    end
  end
end
