# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=auth0
    class UpdateConnectionRequestContentAuth0 < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsAuth0 }, optional: true, nullable: false
      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
