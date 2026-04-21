# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionHTTP < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionHTTPBearer }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHTTPBasicAuth }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHttpApiKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHTTPOauthClientCredentials }
      member -> { Auth0::Types::CreateFlowsVaultConnectionHTTPUninitialized }
    end
  end
end
