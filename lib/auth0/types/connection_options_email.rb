# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'email' connection
    class ConnectionOptionsEmail < Internal::Types::Model
      field :auth_params, -> { String }, optional: true, nullable: false, api_name: "authParams"
      field :brute_force_protection, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :disable_signup, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :email, -> { Auth0::Types::ConnectionEmailEmail }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :totp, -> { Auth0::Types::ConnectionTotpEmail }, optional: true, nullable: false
    end
  end
end
