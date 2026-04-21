# frozen_string_literal: true

module Auth0
  module Types
    # Microsoft Office 365 SSO configuration.
    class ClientAddonOffice365 < Internal::Types::Model
      field :domain, -> { String }, optional: true, nullable: false
      field :connection, -> { String }, optional: true, nullable: false
    end
  end
end
