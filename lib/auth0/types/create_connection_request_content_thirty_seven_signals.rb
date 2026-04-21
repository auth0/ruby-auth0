# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=thirtysevensignals
    class CreateConnectionRequestContentThirtySevenSignals < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentThirtySevenSignalsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsThirtySevenSignals }, optional: true, nullable: false
    end
  end
end
