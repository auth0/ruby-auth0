# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventConnectionUpdatedPreviousObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject1 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject2 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject3 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject4 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject5 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject6 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject7 }
    end
  end
end
