# frozen_string_literal: true

module Auth0
  module Types
    class SetRulesConfigResponseContent < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
