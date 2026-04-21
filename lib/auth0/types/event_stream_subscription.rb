# frozen_string_literal: true

module Auth0
  module Types
    # Event types
    class EventStreamSubscription < Internal::Types::Model
      field :event_type, -> { String }, optional: true, nullable: false
    end
  end
end
