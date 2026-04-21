# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionRequestContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionActivecampaign }
      member -> { Auth0::Types::CreateFlowsVaultConnectionAirtable }
      member -> { Auth0::Types::CreateFlowsVaultConnectionAuth0 }
      member -> { Auth0::Types::CreateFlowsVaultConnectionBigquery }
      member -> { Auth0::Types::CreateFlowsVaultConnectionClearbit }
      member -> { Auth0::Types::CreateFlowsVaultConnectionDocusign }
      member -> { Auth0::Types::CreateFlowsVaultConnectionGoogleSheets }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHTTP }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHubspot }
      member -> { Auth0::Types::CreateFlowsVaultConnectionJwt }
      member -> { Auth0::Types::CreateFlowsVaultConnectionMailchimp }
      member -> { Auth0::Types::CreateFlowsVaultConnectionMailjet }
      member -> { Auth0::Types::CreateFlowsVaultConnectionPipedrive }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSalesforce }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSendgrid }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSlack }
      member -> { Auth0::Types::CreateFlowsVaultConnectionStripe }
      member -> { Auth0::Types::CreateFlowsVaultConnectionTelegram }
      member -> { Auth0::Types::CreateFlowsVaultConnectionTwilio }
      member -> { Auth0::Types::CreateFlowsVaultConnectionWhatsapp }
      member -> { Auth0::Types::CreateFlowsVaultConnectionZapier }
    end
  end
end
