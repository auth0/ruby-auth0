# frozen_string_literal: true

module Auth0
  module Types
    # The branding associated with the organization.
    class EventStreamCloudEventOrgCreatedObjectBranding < Internal::Types::Model
      field :logo_url, -> { String }, optional: true, nullable: false
      field :colors, -> { Auth0::Types::EventStreamCloudEventOrgCreatedObjectBrandingColors }, optional: true, nullable: false
    end
  end
end
