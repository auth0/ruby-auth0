# frozen_string_literal: true

module Auth0
  module Types
    # Controls whether connections from this template are used for organization discovery.
    class OrganizationTemplateUseForOrganizationDiscovery < Internal::Types::Model
      field :default_value, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :allowed_values, -> { Internal::Types::Array[Internal::Types::Boolean] }, optional: true, nullable: false
    end
  end
end
