# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSalesforceSearchLeadsParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :search_field, -> { Auth0::Types::FlowActionSalesforceSearchLeadsParamsSearchField }, optional: false, nullable: false
      field :search_value, -> { String }, optional: false, nullable: false
      field :lead_fields, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
