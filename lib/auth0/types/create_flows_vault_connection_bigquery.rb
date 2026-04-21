# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionBigquery < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionBigqueryJwt }
      member -> { Auth0::Types::CreateFlowsVaultConnectionBigqueryUninitialized }
    end
  end
end
