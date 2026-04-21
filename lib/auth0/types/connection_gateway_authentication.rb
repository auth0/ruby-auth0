# frozen_string_literal: true

module Auth0
  module Types
    # Token-based authentication settings to be applied when connection is using an sms strategy.
    class ConnectionGatewayAuthentication < Internal::Types::Model
      field :method_, -> { String }, optional: false, nullable: false, api_name: "method"
      field :subject, -> { String }, optional: true, nullable: false
      field :audience, -> { String }, optional: false, nullable: false
      field :secret, -> { String }, optional: false, nullable: false
      field :secret_base64encoded, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "secret_base64_encoded"
    end
  end
end
