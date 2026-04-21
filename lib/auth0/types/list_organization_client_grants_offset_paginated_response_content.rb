# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationClientGrantsOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :client_grants, -> { Internal::Types::Array[Auth0::Types::OrganizationClientGrant] }, optional: true, nullable: false
    end
  end
end
