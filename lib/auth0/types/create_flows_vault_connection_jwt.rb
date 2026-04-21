# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionJwt < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionJwtJwt }
      member -> { Auth0::Types::CreateFlowsVaultConnectionJwtUninitialized }
    end
  end
end
