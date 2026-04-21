# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionActivecampaign < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionActivecampaignAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionActivecampaignUninitialized }
    end
  end
end
