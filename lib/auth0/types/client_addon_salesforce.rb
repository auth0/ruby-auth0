# frozen_string_literal: true

module Auth0
  module Types
    # Salesforce SSO configuration.
    class ClientAddonSalesforce < Internal::Types::Model
      field :entity_id, -> { String }, optional: true, nullable: false
    end
  end
end
