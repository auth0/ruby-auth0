# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamEventBridgeDestination < Internal::Types::Model
      field :type, -> { Auth0::Types::EventStreamEventBridgeDestinationTypeEnum }, optional: false, nullable: false
      field :configuration, -> { Auth0::Types::EventStreamEventBridgeConfiguration }, optional: false, nullable: false
    end
  end
end
