# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionXMLSerializeXML < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionXMLSerializeXMLType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionXMLSerializeXMLAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionXMLSerializeXMLParams }, optional: false, nullable: false
    end
  end
end
