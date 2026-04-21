# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=auth0
    class ConnectionResponseContentAuth0 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentAuth0Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAuth0 }, optional: true, nullable: false
    end
  end
end
