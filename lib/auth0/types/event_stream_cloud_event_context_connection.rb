# frozen_string_literal: true

module Auth0
  module Types
    # The Auth0 Connection used for the authentication transaction that generated the event.
    class EventStreamCloudEventContextConnection < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :strategy, -> { String }, optional: false, nullable: false
    end
  end
end
