# frozen_string_literal: true

module Auth0
  module Types
    class ListActionsPaginatedResponseContent < Internal::Types::Model
      field :total, -> { Integer }, optional: true, nullable: false
      field :page, -> { Integer }, optional: true, nullable: false
      field :per_page, -> { Integer }, optional: true, nullable: false
      field :actions, -> { Internal::Types::Array[Auth0::Types::Action] }, optional: true, nullable: false
    end
  end
end
