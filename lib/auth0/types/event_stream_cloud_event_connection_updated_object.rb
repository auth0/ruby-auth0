# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventConnectionUpdatedObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject0 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject1 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject2 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject3 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject4 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject5 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject6 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject7 }
    end
  end
end
