# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=thirtysevensignals
    class ConnectionResponseContentThirtySevenSignals < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentThirtySevenSignalsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsThirtySevenSignals }, optional: true, nullable: false
    end
  end
end
