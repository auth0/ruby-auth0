# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationAllConnectionsOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :connections, -> { Internal::Types::Array[Auth0::Types::OrganizationAllConnectionPost] }, optional: true, nullable: false
    end
  end
end
