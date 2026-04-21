# frozen_string_literal: true

module Auth0
  module Types
    # Active Directory Rights Management Service SSO configuration.
    class ClientAddonRms < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
