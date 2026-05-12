# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupUpdatedObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupUpdatedObject0 }
      member -> { Auth0::Types::EventStreamCloudEventGroupUpdatedObject1 }
      member -> { Auth0::Types::EventStreamCloudEventGroupUpdatedObject2 }
    end
  end
end
