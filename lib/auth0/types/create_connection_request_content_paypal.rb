# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=paypal
    class CreateConnectionRequestContentPaypal < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentPaypalStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsPaypal }, optional: true, nullable: false
    end
  end
end
