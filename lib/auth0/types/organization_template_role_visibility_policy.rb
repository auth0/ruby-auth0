# frozen_string_literal: true

module Auth0
  module Types
    # Controls role visibility for organization administrators.
    class OrganizationTemplateRoleVisibilityPolicy < Internal::Types::Model
      field :default_value, -> { Auth0::Types::OrganizationTemplateRoleVisibilityEnum }, optional: false, nullable: false

      field :overrides, -> { Internal::Types::Array[Auth0::Types::OrganizationTemplateRoleVisibilityOverride] }, optional: true, nullable: false
    end
  end
end
