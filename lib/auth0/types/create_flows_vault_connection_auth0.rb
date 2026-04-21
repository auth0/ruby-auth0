# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionAuth0 < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionAuth0OauthApp }
      member -> { Auth0::Types::CreateFlowsVaultConnectionAuth0Uninitialized }
    end
  end
end
