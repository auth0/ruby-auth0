# frozen_string_literal: true

module Auth0
  module Types
    # Flows Vault Connection configuration.
    class UpdateFlowsVaultConnectionSetup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowsVaultConnectioSetupAPIKeyWithBaseURL }
      member -> { Auth0::Types::FlowsVaultConnectioSetupAPIKey }
      member -> { Auth0::Types::FlowsVaultConnectioSetupOauthApp }
      member -> { Auth0::Types::FlowsVaultConnectioSetupBigqueryOauthJwt }
      member -> { Auth0::Types::FlowsVaultConnectioSetupSecretAPIKey }
      member -> { Auth0::Types::FlowsVaultConnectioSetupHTTPBearer }
      member -> { Auth0::Types::FlowsVaultConnectionHTTPBasicAuthSetup }
      member -> { Auth0::Types::FlowsVaultConnectionHttpApiKeySetup }
      member -> { Auth0::Types::FlowsVaultConnectionHTTPOauthClientCredentialsSetup }
      member -> { Auth0::Types::FlowsVaultConnectioSetupJwt }
      member -> { Auth0::Types::FlowsVaultConnectioSetupMailjetAPIKey }
      member -> { Auth0::Types::FlowsVaultConnectioSetupToken }
      member -> { Auth0::Types::FlowsVaultConnectioSetupWebhook }
      member -> { Auth0::Types::FlowsVaultConnectioSetupStripeKeyPair }
      member -> { Auth0::Types::FlowsVaultConnectioSetupOauthCode }
      member -> { Auth0::Types::FlowsVaultConnectioSetupTwilioAPIKey }
    end
  end
end
