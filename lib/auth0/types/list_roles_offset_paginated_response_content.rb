# frozen_string_literal: true

module Auth0
  module Types
    class ListRolesOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: false, nullable: false

      field :limit, -> { Integer }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :roles, -> { Internal::Types::Array[Auth0::Types::Role] }, optional: true, nullable: false
    end
  end
end
