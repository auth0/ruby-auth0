# frozen_string_literal: true

module Auth0
  module Types
    class ListFlowExecutionsPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :executions, -> { Internal::Types::Array[Auth0::Types::FlowExecutionSummary] }, optional: true, nullable: false
    end
  end
end
