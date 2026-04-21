# frozen_string_literal: true

module Auth0
  module Types
    class ListHooksOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :hooks, -> { Internal::Types::Array[Auth0::Types::Hook] }, optional: true, nullable: false
    end
  end
end
