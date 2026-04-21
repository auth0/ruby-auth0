# frozen_string_literal: true

module Auth0
  module Types
    # Theme defines how to style the login pages.
    class OrganizationBranding < Internal::Types::Model
      field :logo_url, -> { String }, optional: true, nullable: false
      field :colors, -> { Auth0::Types::OrganizationBrandingColors }, optional: true, nullable: false
    end
  end
end
