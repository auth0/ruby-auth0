# frozen_string_literal: true

module Auth0
  module Types
    class CreateEventStreamResponseContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamWebhookResponseContent }
      member -> { Auth0::Types::EventStreamEventBridgeResponseContent }
      member -> { Auth0::Types::EventStreamActionResponseContent }
    end
  end
end
