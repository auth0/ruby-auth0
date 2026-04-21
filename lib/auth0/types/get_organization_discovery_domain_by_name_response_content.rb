# frozen_string_literal: true

module Auth0
  module Types
    class GetOrganizationDiscoveryDomainByNameResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :domain, -> { String }, optional: false, nullable: false
      field :status, -> { Auth0::Types::OrganizationDiscoveryDomainStatus }, optional: false, nullable: false
      field :use_for_organization_discovery, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :verification_txt, -> { String }, optional: false, nullable: false
      field :verification_host, -> { String }, optional: false, nullable: false
    end
  end
end
