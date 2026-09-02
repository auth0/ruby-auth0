# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventGroupDeletedPreviousObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupDeletedPreviousObject0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupDeletedPreviousObject1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupDeletedPreviousObject2 }
    end
  end
end
