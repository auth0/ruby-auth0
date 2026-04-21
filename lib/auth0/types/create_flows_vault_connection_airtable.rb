# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionAirtable < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionAirtableAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionAirtableUninitialized }
    end
  end
end
