# frozen_string_literal: true

module Auth0
  module Flows
    module Executions
      module Types
        class GetFlowExecutionRequestParameters < Internal::Types::Model
          field :flow_id, -> { String }, optional: false, nullable: false
          field :execution_id, -> { String }, optional: false, nullable: false
          field :hydrate, -> { Auth0::Types::GetFlowExecutionRequestParametersHydrateEnum }, optional: true, nullable: false
        end
      end
    end
  end
end
