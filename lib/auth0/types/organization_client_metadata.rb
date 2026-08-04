# frozen_string_literal: true

module Auth0
  module Types
    # Metadata about the associated client.
    class OrganizationClientMetadata < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :app_type, -> { String }, optional: true, nullable: false

      field :logo_uri, -> { String }, optional: true, nullable: false

      field :is_first_party, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :grant_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :organization_usage, -> { Auth0::Types::OrganizationClientMetadataOrganizationUsageEnum }, optional: true, nullable: false
    end
  end
end
