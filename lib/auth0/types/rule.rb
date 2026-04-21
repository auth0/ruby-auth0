# frozen_string_literal: true

module Auth0
  module Types
    class Rule < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :script, -> { String }, optional: true, nullable: false
      field :order, -> { Integer }, optional: true, nullable: false
      field :stage, -> { String }, optional: true, nullable: false
    end
  end
end
