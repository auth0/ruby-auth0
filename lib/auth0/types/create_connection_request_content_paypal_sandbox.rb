# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=paypal-sandbox
    class CreateConnectionRequestContentPaypalSandbox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentPaypalSandboxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsPaypal }, optional: true, nullable: false
    end
  end
end
