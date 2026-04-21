# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionSendgrid < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionSendgridAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSendgridUninitialized }
    end
  end
end
