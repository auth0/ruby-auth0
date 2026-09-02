# frozen_string_literal: true

module Auth0
  module Types
    # A role visibility override.
    class OrganizationTemplateRoleVisibilityOverride < Internal::Types::Model
      field :role_id, -> { String }, optional: false, nullable: false

      field :access, -> { Auth0::Types::OrganizationTemplateRoleVisibilityEnum }, optional: false, nullable: false
    end
  end
end
