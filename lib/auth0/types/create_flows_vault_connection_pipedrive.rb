# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionPipedrive < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionPipedriveToken }
      member -> { Auth0::Types::CreateFlowsVaultConnectionPipedriveOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionPipedriveUninitialized }
    end
  end
end
