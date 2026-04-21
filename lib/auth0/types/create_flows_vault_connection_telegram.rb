# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionTelegram < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionTelegramToken }
      member -> { Auth0::Types::CreateFlowsVaultConnectionTelegramUninitialized }
    end
  end
end
