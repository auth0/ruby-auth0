# frozen_string_literal: true

module Auth0
  module Types
    class ListRulesOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :rules, -> { Internal::Types::Array[Auth0::Types::Rule] }, optional: true, nullable: false
    end
  end
end
