# frozen_string_literal: true

module Auth0
  module Types
    class ListUsersOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :length, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :users, -> { Internal::Types::Array[Auth0::Types::UserResponseSchema] }, optional: true, nullable: false
    end
  end
end
