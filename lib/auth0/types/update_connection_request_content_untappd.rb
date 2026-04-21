# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=untappd
    class UpdateConnectionRequestContentUntappd < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsUntappd }, optional: true, nullable: false
    end
  end
end
