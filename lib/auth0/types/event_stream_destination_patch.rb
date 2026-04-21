# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamDestinationPatch < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamWebhookDestination }
      member -> { Auth0::Types::EventStreamActionDestination }
    end
  end
end
