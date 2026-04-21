# frozen_string_literal: true

module Auth0
  module Organizations
    module Connections
      module Types
        class UpdateOrganizationConnectionRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :connection_id, -> { String }, optional: false, nullable: false
          field :organization_connection_name, -> { String }, optional: true, nullable: false
          field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :is_signup_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :organization_access_level, -> { Auth0::Types::OrganizationAccessLevelEnumWithNull }, optional: true, nullable: false
          field :is_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
