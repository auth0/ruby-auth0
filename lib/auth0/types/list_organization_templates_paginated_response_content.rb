# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationTemplatesPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"

      field :organization_templates, -> { Internal::Types::Array[Auth0::Types::OrganizationTemplate] }, optional: true, nullable: false
    end
  end
end
