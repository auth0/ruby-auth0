# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupCreatedObject < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventGroupCreatedObject0 }
      member -> { Auth0::Types::EventStreamCloudEventGroupCreatedObject1 }
      member -> { Auth0::Types::EventStreamCloudEventGroupCreatedObject2 }
    end
  end
end
