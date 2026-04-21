# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=apple
    class CreateConnectionRequestContentApple < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAppleStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsApple }, optional: true, nullable: false
    end
  end
end
