# frozen_string_literal: true

module Auth0
  module Rules
    module Types
      class UpdateRuleRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :script, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :order, -> { Integer }, optional: true, nullable: false
        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
