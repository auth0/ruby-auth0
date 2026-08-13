# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventConnectionCreatedObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject0 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject1 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject4 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject5 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject6 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject7 }
    end
  end
end
