# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=auth0-oidc
    class UpdateConnectionRequestContentAuth0Oidc < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsAuth0Oidc }, optional: true, nullable: false
    end
  end
end
