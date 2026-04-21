# frozen_string_literal: true

module Auth0
  module Organizations
    module Types
      class CreateOrganizationRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :display_name, -> { String }, optional: true, nullable: false
        field :branding, -> { Auth0::Types::OrganizationBranding }, optional: true, nullable: false
        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
        field :enabled_connections, -> { Internal::Types::Array[Auth0::Types::ConnectionForOrganization] }, optional: true, nullable: false
        field :token_quota, -> { Auth0::Types::CreateTokenQuota }, optional: true, nullable: false
      end
    end
  end
end
