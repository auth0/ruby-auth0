# frozen_string_literal: true

module Auth0
  module Types
    # [Private Early Access] Session cookie configuration.
    class SessionCookieMetadata < Internal::Types::Model
      field :mode, -> { Auth0::Types::SessionCookieMetadataModeEnum }, optional: true, nullable: false
    end
  end
end
