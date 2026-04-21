# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionHubspot < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionHubspotAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHubspotOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHubspotUninitialized }
    end
  end
end
