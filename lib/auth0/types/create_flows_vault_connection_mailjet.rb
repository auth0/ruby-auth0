# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionMailjet < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionMailjetAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionMailjetUninitialized }
    end
  end
end
