# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowMapValue < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionFlowMapValueType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionFlowMapValueAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionFlowMapValueParams }, optional: false, nullable: false
    end
  end
end
