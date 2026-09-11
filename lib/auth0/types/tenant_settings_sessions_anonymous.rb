# frozen_string_literal: true

module Auth0
  module Types
    # Anonymous session settings for tenant.
    class TenantSettingsSessionsAnonymous < Internal::Types::Model
      field :lifetime_in_minutes, -> { Integer }, optional: true, nullable: false

      field :activate_cookie, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
