# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionSalesforce < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionSalesforceOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSalesforceUninitialized }
    end
  end
end
