# frozen_string_literal: true

module Auth0
  module Types
    # Optional token-based authentication configuration for the SMS gateway
    class ConnectionGatewayAuthenticationSms < Internal::Types::Model
      field :audience, -> { String }, optional: false, nullable: false
      field :method_, -> { String }, optional: false, nullable: false, api_name: "method"
      field :secret, -> { String }, optional: false, nullable: false
      field :secret_base64encoded, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "secret_base64_encoded"
      field :subject, -> { String }, optional: true, nullable: false
    end
  end
end
