# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=apple
    class UpdateConnectionRequestContentApple < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsApple }, optional: true, nullable: false
    end
  end
end
