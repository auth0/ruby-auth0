# frozen_string_literal: true

module Auth0
  module Types
    # Egnyte SSO configuration.
    class ClientAddonEgnyte < Internal::Types::Model
      field :domain, -> { String }, optional: true, nullable: false
    end
  end
end
