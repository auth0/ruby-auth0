# frozen_string_literal: true

module Auth0
  module Types
    # Strategy-specific overrides for user ID
    class UserAttributeProfileStrategyOverridesUserID < Internal::Types::Model
      field :pingfederate, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
      field :ad, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
      field :adfs, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
      field :waad, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
      field :google_apps, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false, api_name: "google-apps"
      field :okta, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
      field :oidc, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
      field :samlp, -> { Auth0::Types::UserAttributeProfileStrategyOverridesUserIDMapping }, optional: true, nullable: false
    end
  end
end
