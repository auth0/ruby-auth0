# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=auth0
    class CreateConnectionRequestContentAuth0 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAuth0Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAuth0 }, optional: true, nullable: false
      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
