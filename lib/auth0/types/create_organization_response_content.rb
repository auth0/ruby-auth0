# frozen_string_literal: true

module Auth0
  module Types
    class CreateOrganizationResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
      field :branding, -> { Auth0::Types::OrganizationBranding }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :token_quota, -> { Auth0::Types::TokenQuota }, optional: true, nullable: false
      field :enabled_connections, -> { Internal::Types::Array[Auth0::Types::OrganizationEnabledConnection] }, optional: true, nullable: false
    end
  end
end
