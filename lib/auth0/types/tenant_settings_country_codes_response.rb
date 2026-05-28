# frozen_string_literal: true

module Auth0
  module Types
    # Phone country code configuration for identifier input.
    class TenantSettingsCountryCodesResponse < Internal::Types::Model
      field :list, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :mode, -> { Auth0::Types::TenantSettingsCountryCodesModeResponse }, optional: true, nullable: false
    end
  end
end
