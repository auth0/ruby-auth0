# frozen_string_literal: true

module Auth0
  module Types
    # Auth0 client fields mapped from the Client ID Metadata Document
    class CimdMappedClientFields < Internal::Types::Model
      field :external_client_id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :app_type, -> { String }, optional: true, nullable: false
      field :callbacks, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :logo_uri, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :grant_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :token_endpoint_auth_method, -> { String }, optional: true, nullable: false
      field :jwks_uri, -> { String }, optional: true, nullable: false
      field :client_authentication_methods, -> { Auth0::Types::CimdMappedClientAuthenticationMethods }, optional: true, nullable: false
    end
  end
end
