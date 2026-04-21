# frozen_string_literal: true

module Auth0
  module Types
    # SAP API addon configuration.
    class ClientAddonSapapi < Internal::Types::Model
      field :clientid, -> { String }, optional: true, nullable: false
      field :username_attribute, -> { String }, optional: true, nullable: false, api_name: "usernameAttribute"
      field :token_endpoint_url, -> { String }, optional: true, nullable: false, api_name: "tokenEndpointUrl"
      field :scope, -> { String }, optional: true, nullable: false
      field :service_password, -> { String }, optional: true, nullable: false, api_name: "servicePassword"
      field :name_identifier_format, -> { String }, optional: true, nullable: false, api_name: "nameIdentifierFormat"
    end
  end
end
