# frozen_string_literal: true

module Auth0
  module Types
    # Color scheme used to customize the login pages.
    class EventStreamCloudEventOrgCreatedObjectBrandingColors < Internal::Types::Model
      field :primary, -> { String }, optional: true, nullable: false
      field :page_background, -> { String }, optional: true, nullable: false
    end
  end
end
