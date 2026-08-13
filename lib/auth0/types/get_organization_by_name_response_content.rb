# frozen_string_literal: true

module Auth0
  module Types
    class GetOrganizationByNameResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :branding, -> { Auth0::Types::OrganizationBranding }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :token_quota, -> { Auth0::Types::TokenQuota }, optional: true, nullable: false

      field :third_party_client_access, -> { Auth0::Types::OrganizationThirdPartyClientAccessEnum }, optional: true, nullable: false

      field :is_app_entitlement_active, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :client, -> { Auth0::Types::OrganizationClientAssociation }, optional: true, nullable: false
    end
  end
end
