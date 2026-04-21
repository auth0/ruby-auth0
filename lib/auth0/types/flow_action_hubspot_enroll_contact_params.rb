# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHubspotEnrollContactParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
      field :workflow_id, -> { Auth0::Types::FlowActionHubspotEnrollContactParamsWorkflowID }, optional: false, nullable: false
    end
  end
end
