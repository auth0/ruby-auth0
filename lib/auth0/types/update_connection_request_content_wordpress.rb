# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=wordpress
    class UpdateConnectionRequestContentWordpress < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsWordpress }, optional: true, nullable: false
    end
  end
end
