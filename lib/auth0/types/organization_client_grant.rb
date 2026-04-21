# frozen_string_literal: true

module Auth0
  module Types
    class OrganizationClientGrant < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :organization_usage, -> { Auth0::Types::OrganizationUsageEnum }, optional: true, nullable: false
      field :allow_any_organization, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
