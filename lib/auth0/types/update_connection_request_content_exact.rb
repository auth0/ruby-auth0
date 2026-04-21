# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=exact
    class UpdateConnectionRequestContentExact < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsExact }, optional: true, nullable: false
    end
  end
end
