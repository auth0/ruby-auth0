# frozen_string_literal: true

module Auth0
  module Types
    # Session cookie configuration
    class SessionCookieSchema < Internal::Types::Model
      field :mode, -> { Auth0::Types::SessionCookieModeEnum }, optional: false, nullable: false
    end
  end
end
