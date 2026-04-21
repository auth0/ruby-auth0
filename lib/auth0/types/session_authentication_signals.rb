# frozen_string_literal: true

module Auth0
  module Types
    # Details about authentication signals obtained during the login flow
    class SessionAuthenticationSignals < Internal::Types::Model
      field :methods, -> { Internal::Types::Array[Auth0::Types::SessionAuthenticationSignal] }, optional: true, nullable: false
    end
  end
end
