# frozen_string_literal: true

module Auth0
  module Types
    class ListUserRolesOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :roles, -> { Internal::Types::Array[Auth0::Types::Role] }, optional: true, nullable: false
    end
  end
end
