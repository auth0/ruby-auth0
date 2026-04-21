# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=auth0-oidc
    class ConnectionResponseContentAuth0Oidc < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentAuth0OidcStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAuth0Oidc }, optional: true, nullable: false
    end
  end
end
