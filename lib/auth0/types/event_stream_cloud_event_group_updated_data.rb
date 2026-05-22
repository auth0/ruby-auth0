# frozen_string_literal: true

module Auth0
  module Types
    # The event payload.
    class EventStreamCloudEventGroupUpdatedData < Internal::Types::Model
      field :object, -> { Auth0::Types::EventStreamCloudEventGroupUpdatedObject }, optional: false, nullable: false

      field :context, -> { Auth0::Types::EventStreamCloudEventContext }, optional: true, nullable: false
    end
  end
end
