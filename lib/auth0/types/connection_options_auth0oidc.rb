# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'auth0-oidc' connection
    class ConnectionOptionsAuth0Oidc < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
    end
  end
end
