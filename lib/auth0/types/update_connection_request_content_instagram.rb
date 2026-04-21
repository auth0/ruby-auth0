# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=instagram
    class UpdateConnectionRequestContentInstagram < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsInstagram }, optional: true, nullable: false
    end
  end
end
