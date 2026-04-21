# frozen_string_literal: true

module Auth0
  module Types
    class ListLogOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :length, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :logs, -> { Internal::Types::Array[Auth0::Types::Log] }, optional: true, nullable: false
    end
  end
end
