# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowReturnJSONParams < Internal::Types::Model
      field :payload, -> { Auth0::Types::FlowActionFlowReturnJSONParamsPayload }, optional: false, nullable: false
    end
  end
end
