# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for delegation (impersonation) access using Session Transfer Tokens
    class ClientSessionTransferDelegationConfiguration < Internal::Types::Model
      field :allow_delegated_access, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :enforce_device_binding, -> { Auth0::Types::ClientSessionTransferDelegationDeviceBindingEnum }, optional: true, nullable: false
    end
  end
end
