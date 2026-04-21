# frozen_string_literal: true

module Auth0
  module Types
    # SharePoint SSO configuration.
    class ClientAddonSharePoint < Internal::Types::Model
      field :url, -> { String }, optional: true, nullable: false
      field :external_url, -> { Auth0::Types::ClientAddonSharePointExternalURL }, optional: true, nullable: false
    end
  end
end
