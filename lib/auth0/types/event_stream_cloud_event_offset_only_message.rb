# frozen_string_literal: true

module Auth0
  module Types
    # An offset-only heartbeat message. Advances the cursor without delivering an event.
    class EventStreamCloudEventOffsetOnlyMessage < Internal::Types::Model
      field :offset, -> { String }, optional: false, nullable: false
    end
  end
end
