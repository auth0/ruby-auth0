# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventConnectionDeletedObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject0 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject1 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject2 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject3 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject4 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject5 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject6 }

      member -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7 }
    end
  end
end
