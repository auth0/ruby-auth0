# frozen_string_literal: true

module Auth0
  module Types
    # The event payload.
    class EventStreamCloudEventConnectionCreatedData < Internal::Types::Model
      field :object, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject }, optional: false, nullable: false

      field :context, -> { Auth0::Types::EventStreamCloudEventContext }, optional: true, nullable: false
    end
  end
end
