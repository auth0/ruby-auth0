# frozen_string_literal: true

module Auth0
  module Types
    class ListResourceServerOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :resource_servers, -> { Internal::Types::Array[Auth0::Types::ResourceServer] }, optional: true, nullable: false
    end
  end
end
