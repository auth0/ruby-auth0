# frozen_string_literal: true

module Auth0
  module Types
    # Holds per-stage configuration options (max_attempts and rate).
    class SuspiciousIPThrottlingStage < Internal::Types::Model
      field :pre_login, -> { Auth0::Types::SuspiciousIPThrottlingPreLoginStage }, optional: true, nullable: false, api_name: "pre-login"

      field :pre_user_registration, -> { Auth0::Types::SuspiciousIPThrottlingPreUserRegistrationStage }, optional: true, nullable: false, api_name: "pre-user-registration"

      field :pre_custom_token_exchange, -> { Auth0::Types::SuspiciousIPThrottlingPreCustomTokenExchangeStage }, optional: true, nullable: false, api_name: "pre-custom-token-exchange"
    end
  end
end
