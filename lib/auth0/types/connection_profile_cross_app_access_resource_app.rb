# frozen_string_literal: true

module Auth0
  module Types
    # Controls whether organization admins may enable Cross App Access (XAA) on their Identity Providers.
    class ConnectionProfileCrossAppAccessResourceApp < Internal::Types::Model
      field :status, -> { Auth0::Types::ConnectionProfileCrossAppAccessResourceAppStatus }, optional: false, nullable: false
    end
  end
end
