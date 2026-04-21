# frozen_string_literal: true

module Auth0
  module Organizations
    module Types
      class UpdateOrganizationRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :display_name, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :branding, -> { Auth0::Types::OrganizationBranding }, optional: true, nullable: false
        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
        field :token_quota, -> { Auth0::Types::UpdateTokenQuota }, optional: true, nullable: false
      end
    end
  end
end
