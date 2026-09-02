# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventGroupCreatedPreviousObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupCreatedPreviousObject0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupCreatedPreviousObject1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupCreatedPreviousObject2 }
    end
  end
end
