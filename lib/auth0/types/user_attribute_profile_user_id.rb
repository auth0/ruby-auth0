# frozen_string_literal: true

module Auth0
  module Types
    # User ID mapping configuration
    class UserAttributeProfileUserID < Internal::Types::Model
      field :oidc_mapping, -> { Auth0::Types::UserAttributeProfileUserIDOidcMappingEnum }, optional: true, nullable: false
      field :saml_mapping, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :scim_mapping, -> { String }, optional: true, nullable: false
      field :strategy_overrides, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserID }, optional: true, nullable: false
    end
  end
end
