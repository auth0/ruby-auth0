# frozen_string_literal: true

module Auth0
  module Types
    # Controls whether session metadata is included in the logout token. Default value is null.
    class ClientOidcBackchannelLogoutSessionMetadata < Internal::Types::Model
      field :include, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
