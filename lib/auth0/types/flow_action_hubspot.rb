# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHubspot < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionHubspotEnrollContact }
      member -> { Auth0::Types::FlowActionHubspotGetContact }
      member -> { Auth0::Types::FlowActionHubspotUpsertContact }
    end
  end
end
