# frozen_string_literal: true

module Auth0
  module Types
    # Traffic matching criteria for the policy. Exactly one of auth0_managed or geo_country_codes must be specified.
    class AttackProtectionCaptchaPolicyMatch < Internal::Types::Model
      field :auth0managed, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "auth0_managed"

      field :geo_country_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
