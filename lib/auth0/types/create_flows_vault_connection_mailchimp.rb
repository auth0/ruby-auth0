# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionMailchimp < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateFlowsVaultConnectionMailchimpAPIKey }
      member -> { Auth0::Types::CreateFlowsVaultConnectionMailchimpOauthCode }
      member -> { Auth0::Types::CreateFlowsVaultConnectionMailchimpUninitialized }
    end
  end
end
