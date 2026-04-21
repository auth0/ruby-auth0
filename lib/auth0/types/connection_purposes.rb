# frozen_string_literal: true

module Auth0
  module Types
    # Purposes for a connection
    class ConnectionPurposes < Internal::Types::Model
      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false
      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurpose }, optional: true, nullable: false
    end
  end
end
