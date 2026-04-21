# frozen_string_literal: true

module Auth0
  module Types
    class UserAttributeProfileUserAttributeAdditionalProperties < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false
      field :label, -> { String }, optional: false, nullable: false
      field :profile_required, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :auth0mapping, -> { String }, optional: false, nullable: false, api_name: "auth0_mapping"
      field :oidc_mapping, -> { Auth0::Types::UserAttributeProfileOidcMapping }, optional: true, nullable: false
      field :saml_mapping, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :scim_mapping, -> { String }, optional: true, nullable: false
      field :strategy_overrides, -> { Auth0::Types::UserAttributeProfileStrategyOverrides }, optional: true, nullable: false
    end
  end
end
