# frozen_string_literal: true

module Auth0
  module Types
    # Zendesk SSO configuration.
    class ClientAddonZendesk < Internal::Types::Model
      field :account_name, -> { String }, optional: true, nullable: false, api_name: "accountName"
    end
  end
end
