# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionStripe < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionStripeKeyPair }
      member -> { Auth0::Types::CreateFlowsVaultConnectionStripeOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionStripeUninitialized }
    end
  end
end
