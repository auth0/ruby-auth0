# frozen_string_literal: true

module Auth0
  module Types
    # Zoom SSO configuration.
    class ClientAddonZoom < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: false
    end
  end
end
