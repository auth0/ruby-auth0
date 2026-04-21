# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for OIDC backchannel logout
    class ClientOidcBackchannelLogoutSettings < Internal::Types::Model
      field :backchannel_logout_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :backchannel_logout_initiators, -> { Auth0::Types::ClientOidcBackchannelLogoutInitiators }, optional: true, nullable: false
      field :backchannel_logout_session_metadata, -> { Auth0::Types::ClientOidcBackchannelLogoutSessionMetadata }, optional: true, nullable: false
    end
  end
end
