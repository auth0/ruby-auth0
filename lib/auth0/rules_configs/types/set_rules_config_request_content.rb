# frozen_string_literal: true

module Auth0
  module RulesConfigs
    module Types
      class SetRulesConfigRequestContent < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false
        field :value, -> { String }, optional: false, nullable: false
      end
    end
  end
end
