# frozen_string_literal: true

module Auth0
  module Hooks
    module Types
      class UpdateHookRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :script, -> { String }, optional: true, nullable: false
        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :dependencies, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
