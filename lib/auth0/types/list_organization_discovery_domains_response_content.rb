# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationDiscoveryDomainsResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :domains, -> { Internal::Types::Array[Auth0::Types::OrganizationDiscoveryDomain] }, optional: false, nullable: false
    end
  end
end
