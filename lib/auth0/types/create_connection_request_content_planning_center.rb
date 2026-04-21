# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=planningcenter
    class CreateConnectionRequestContentPlanningCenter < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentPlanningCenterStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsPlanningCenter }, optional: true, nullable: false
    end
  end
end
