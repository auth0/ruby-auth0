# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionTwilio < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionTwilioAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionTwilioUninitialized }
    end
  end
end
