# frozen_string_literal: true

module Auth0
  module ClientGrants
    module Types
      class UpdateClientGrantRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :organization_usage, -> { Auth0::Types::ClientGrantOrganizationNullableUsageEnum }, optional: true, nullable: false
        field :allow_any_organization, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :authorization_details_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :allow_all_scopes, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
