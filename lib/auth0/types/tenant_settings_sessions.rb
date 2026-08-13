# frozen_string_literal: true

module Auth0
  module Types
    # Sessions related settings for tenant
    class TenantSettingsSessions < Internal::Types::Model
      field :oidc_logout_prompt_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
