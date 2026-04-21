# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHubspotUpsertContactParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
      field :properties, -> { Internal::Types::Array[Auth0::Types::FlowActionHubspotUpsertContactParamsProperty] }, optional: true, nullable: false
    end
  end
end
