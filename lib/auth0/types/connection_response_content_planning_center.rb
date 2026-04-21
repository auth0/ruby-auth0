# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=planningcenter
    class ConnectionResponseContentPlanningCenter < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentPlanningCenterStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsPlanningCenter }, optional: true, nullable: false
    end
  end
end
