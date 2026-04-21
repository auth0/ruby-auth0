# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=paypal-sandbox
    class ConnectionResponseContentPaypalSandbox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentPaypalSandboxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsPaypal }, optional: true, nullable: false
    end
  end
end
