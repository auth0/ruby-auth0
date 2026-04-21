# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=auth0-oidc
    class CreateConnectionRequestContentAuth0Oidc < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAuth0OidcStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAuth0Oidc }, optional: true, nullable: false
    end
  end
end
