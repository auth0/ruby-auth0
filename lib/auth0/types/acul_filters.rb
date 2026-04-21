# frozen_string_literal: true

module Auth0
  module Types
    # Optional filters to apply rendering rules to specific entities
    class AculFilters < Internal::Types::Model
      field :match_type, -> { Auth0::Types::AculMatchTypeEnum }, optional: true, nullable: false
      field :clients, -> { Internal::Types::Array[Auth0::Types::AculClientFilter] }, optional: true, nullable: false
      field :organizations, -> { Internal::Types::Array[Auth0::Types::AculOrganizationFilter] }, optional: true, nullable: false
      field :domains, -> { Internal::Types::Array[Auth0::Types::AculDomainFilter] }, optional: true, nullable: false
    end
  end
end
