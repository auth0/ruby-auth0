# frozen_string_literal: true

module Auth0
  module Flows
    module Executions
      module Types
        class ListFlowExecutionsRequestParameters < Internal::Types::Model
          field :flow_id, -> { String }, optional: false, nullable: false
          field :from, -> { String }, optional: true, nullable: false
          field :take, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
