# frozen_string_literal: true

module Auth0
  module Types
    # Color scheme used to customize the login pages.
    class OrganizationBrandingColors < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: false
      field :page_background, -> { String }, optional: false, nullable: false
    end
  end
end
