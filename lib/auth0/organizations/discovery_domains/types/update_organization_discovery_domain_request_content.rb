# frozen_string_literal: true

module Auth0
  module Organizations
    module DiscoveryDomains
      module Types
        class UpdateOrganizationDiscoveryDomainRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :discovery_domain_id, -> { String }, optional: false, nullable: false
          field :status, -> { Auth0::Types::OrganizationDiscoveryDomainStatus }, optional: true, nullable: false
          field :use_for_organization_discovery, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
