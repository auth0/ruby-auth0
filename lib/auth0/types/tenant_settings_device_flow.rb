# frozen_string_literal: true

module Auth0
  module Types
    # Device Flow configuration
    class TenantSettingsDeviceFlow < Internal::Types::Model
      field :charset, -> { Auth0::Types::TenantSettingsDeviceFlowCharset }, optional: true, nullable: false
      field :mask, -> { String }, optional: true, nullable: false
    end
  end
end
