# frozen_string_literal: true

module Auth0
  module Types
    class UserAttributeProfileStrategyOverridesMapping < Internal::Types::Model
      field :oidc_mapping, -> { Auth0::Types::UserAttributeProfileOidcMapping }, optional: true, nullable: false
      field :saml_mapping, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :scim_mapping, -> { String }, optional: true, nullable: false
    end
  end
end
