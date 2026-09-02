# frozen_string_literal: true

module Auth0
  module Types
    # An organization assigned to the template.
    class OrganizationTemplateAssignedOrganization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
