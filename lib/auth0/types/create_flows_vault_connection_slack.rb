# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionSlack < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionSlackWebhook }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSlackOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionSlackUninitialized }
    end
  end
end
