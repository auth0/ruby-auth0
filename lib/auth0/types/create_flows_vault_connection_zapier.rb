# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionZapier < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionZapierWebhook }
      member -> { Auth0::Types::CreateFlowsVaultConnectionZapierUninitialized }
    end
  end
end
