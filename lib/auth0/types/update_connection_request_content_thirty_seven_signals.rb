# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=thirtysevensignals
    class UpdateConnectionRequestContentThirtySevenSignals < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsThirtySevenSignals }, optional: true, nullable: false
    end
  end
end
