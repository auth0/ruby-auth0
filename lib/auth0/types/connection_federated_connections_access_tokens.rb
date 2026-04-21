# frozen_string_literal: true

module Auth0
  module Types
    # Federated Connections Access Tokens
    class ConnectionFederatedConnectionsAccessTokens < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
