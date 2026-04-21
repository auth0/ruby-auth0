# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=apple
    class ConnectionResponseContentApple < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentAppleStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsApple }, optional: true, nullable: false
    end
  end
end
