# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventConnectionDeletedPreviousObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject0 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject1 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject2 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject3 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject4 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject5 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject6 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedPreviousObject7 }
    end
  end
end
