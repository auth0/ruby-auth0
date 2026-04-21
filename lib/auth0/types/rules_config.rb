# frozen_string_literal: true

module Auth0
  module Types
    class RulesConfig < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false
    end
  end
end
