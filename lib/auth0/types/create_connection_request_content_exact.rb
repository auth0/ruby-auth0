# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=exact
    class CreateConnectionRequestContentExact < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentExactStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsExact }, optional: true, nullable: false
    end
  end
end
