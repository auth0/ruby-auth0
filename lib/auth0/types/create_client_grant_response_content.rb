# frozen_string_literal: true

module Auth0
  module Types
    class CreateClientGrantResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :organization_usage, -> { Auth0::Types::ClientGrantOrganizationUsageEnum }, optional: true, nullable: false
      field :allow_any_organization, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :default_for, -> { Auth0::Types::ClientGrantDefaultForEnum }, optional: true, nullable: false
      field :is_system, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :subject_type, -> { Auth0::Types::ClientGrantSubjectTypeEnum }, optional: true, nullable: false
      field :authorization_details_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :allow_all_scopes, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
