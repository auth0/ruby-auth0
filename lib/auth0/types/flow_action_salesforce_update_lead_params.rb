# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSalesforceUpdateLeadParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :lead_id, -> { String }, optional: false, nullable: false
      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
