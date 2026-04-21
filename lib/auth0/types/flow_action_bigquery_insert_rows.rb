# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionBigqueryInsertRows < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionBigqueryInsertRowsType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionBigqueryInsertRowsAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionBigqueryInsertRowsParams }, optional: false, nullable: false
    end
  end
end
