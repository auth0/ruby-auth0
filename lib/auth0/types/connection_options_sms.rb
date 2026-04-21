# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'sms' connection
    class ConnectionOptionsSms < Internal::Types::Model
      field :brute_force_protection, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_signup, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :forward_req_info, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :from, -> { String }, optional: true, nullable: false
      field :gateway_authentication, -> { Auth0::Types::ConnectionGatewayAuthenticationSms }, optional: true, nullable: false
      field :gateway_url, -> { String }, optional: true, nullable: false
      field :messaging_service_sid, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :provider, -> { Auth0::Types::ConnectionProviderEnumSms }, optional: true, nullable: false
      field :syntax, -> { Auth0::Types::ConnectionTemplateSyntaxEnumSms }, optional: true, nullable: false
      field :template, -> { String }, optional: true, nullable: false
      field :totp, -> { Auth0::Types::ConnectionTotpSms }, optional: true, nullable: false
      field :twilio_sid, -> { String }, optional: true, nullable: false
      field :twilio_token, -> { String }, optional: true, nullable: false
    end
  end
end
