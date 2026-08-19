# frozen_string_literal: true

module Auth0
  module Types
    # The third-party client access configuration for the My Organization Configuration.
    class ClientMyOrganizationThirdPartyClientAccessConfiguration < Internal::Types::Model
      field :default_value, -> { Auth0::Types::ClientMyOrganizationConfigurationThirdPartyClientAccessDefaultValueEnum }, optional: false, nullable: false

      field :allowed_values, -> { Internal::Types::Array[Auth0::Types::ClientMyOrganizationConfigurationThirdPartyClientAccessAllowedValuesEnum] }, optional: false, nullable: false
    end
  end
end
