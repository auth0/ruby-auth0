# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventConnectionCreatedPreviousObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject0 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject1 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject2 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject3 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject4 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject5 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject6 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionCreatedPreviousObject7 }
    end
  end
end
