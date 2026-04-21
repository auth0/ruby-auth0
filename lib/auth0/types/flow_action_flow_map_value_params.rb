# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowMapValueParams < Internal::Types::Model
      field :input, -> { Auth0::Types::FlowActionFlowMapValueParamsInput }, optional: false, nullable: false
      field :cases, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :fallback, -> { Auth0::Types::FlowActionFlowMapValueParamsFallback }, optional: true, nullable: false
    end
  end
end
