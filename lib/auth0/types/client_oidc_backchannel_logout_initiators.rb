# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for OIDC backchannel logout initiators
    class ClientOidcBackchannelLogoutInitiators < Internal::Types::Model
      field :mode, -> { Auth0::Types::ClientOidcBackchannelLogoutInitiatorsModeEnum }, optional: true, nullable: false
      field :selected_initiators, -> { Internal::Types::Array[Auth0::Types::ClientOidcBackchannelLogoutInitiatorsEnum] }, optional: true, nullable: false
    end
  end
end
