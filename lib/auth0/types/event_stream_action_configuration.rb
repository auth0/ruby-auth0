# frozen_string_literal: true

module Auth0
  module Types
    # Configuration specific to an action destination.
    class EventStreamActionConfiguration < Internal::Types::Model
      field :action_id, -> { String }, optional: false, nullable: false
    end
  end
end
