# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=paypal
    class UpdateConnectionRequestContentPaypal < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsPaypal }, optional: true, nullable: false
    end
  end
end
