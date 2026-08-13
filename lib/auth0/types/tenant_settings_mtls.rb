# frozen_string_literal: true

module Auth0
  module Types
    # mTLS configuration.
    class TenantSettingsMtls < Internal::Types::Model
      field :enable_endpoint_aliases, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
