# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionClearbit < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionClearbitAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionClearbitUninitialized }
    end
  end
end
