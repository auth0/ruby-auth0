# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionWhatsapp < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionWhatsappToken }
      member -> { Auth0::Types::CreateFlowsVaultConnectionWhatsappUninitialized }
    end
  end
end
