# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for storing identity provider tokens in Auth0's Token Vault. When active, Auth0 securely stores
    # access and refresh tokens from federated logins, enabling your application to make authenticated API calls on
    # behalf of users.
    class EventStreamCloudEventConnectionUpdatedObject0OptionsFederatedConnectionsAccessTokens < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
