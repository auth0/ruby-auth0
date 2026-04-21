# frozen_string_literal: true

module Auth0
  module Types
    # Native to Web SSO Configuration
    class ClientSessionTransferConfiguration < Internal::Types::Model
      field :can_create_session_transfer_token, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enforce_cascade_revocation, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allowed_authentication_methods, -> { Internal::Types::Array[Auth0::Types::ClientSessionTransferAllowedAuthenticationMethodsEnum] }, optional: true, nullable: false
      field :enforce_device_binding, -> { Auth0::Types::ClientSessionTransferDeviceBindingEnum }, optional: true, nullable: false
      field :allow_refresh_token, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enforce_online_refresh_tokens, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
