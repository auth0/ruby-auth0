# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionDocusign < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionDocusignOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionDocusignUninitialized }
    end
  end
end
