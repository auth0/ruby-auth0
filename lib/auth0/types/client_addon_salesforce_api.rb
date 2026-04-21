# frozen_string_literal: true

module Auth0
  module Types
    # Salesforce API addon configuration.
    class ClientAddonSalesforceAPI < Internal::Types::Model
      field :clientid, -> { String }, optional: true, nullable: false
      field :principal, -> { String }, optional: true, nullable: false
      field :community_name, -> { String }, optional: true, nullable: false, api_name: "communityName"
      field :community_url_section, -> { String }, optional: true, nullable: false
    end
  end
end
