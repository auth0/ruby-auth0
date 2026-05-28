# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupDeletedObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupDeletedObject0 }

      member -> { Auth0::Types::EventStreamCloudEventGroupDeletedObject1 }

      member -> { Auth0::Types::EventStreamCloudEventGroupDeletedObject2 }
    end
  end
end
