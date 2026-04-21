# frozen_string_literal: true

module Auth0
  module Types
    class ListUserOrganizationsOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :organizations, -> { Internal::Types::Array[Auth0::Types::Organization] }, optional: true, nullable: false
    end
  end
end
