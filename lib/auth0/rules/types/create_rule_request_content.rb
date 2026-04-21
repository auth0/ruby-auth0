# frozen_string_literal: true

module Auth0
  module Rules
    module Types
      class CreateRuleRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :script, -> { String }, optional: false, nullable: false
        field :order, -> { Integer }, optional: true, nullable: false
        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
