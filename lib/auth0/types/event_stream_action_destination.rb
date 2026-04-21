# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamActionDestination < Internal::Types::Model
      field :type, -> { Auth0::Types::EventStreamActionDestinationTypeEnum }, optional: false, nullable: false
      field :configuration, -> { Auth0::Types::EventStreamActionConfiguration }, optional: false, nullable: false
    end
  end
end
