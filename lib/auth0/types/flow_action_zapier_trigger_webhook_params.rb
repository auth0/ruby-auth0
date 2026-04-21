# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionZapierTriggerWebhookParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :method_, -> { Auth0::Types::FlowActionZapierTriggerWebhookParamsMethod }, optional: true, nullable: false, api_name: "method"
    end
  end
end
