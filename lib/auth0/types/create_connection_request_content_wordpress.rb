# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=wordpress
    class CreateConnectionRequestContentWordpress < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentWordpressStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsWordpress }, optional: true, nullable: false
    end
  end
end
