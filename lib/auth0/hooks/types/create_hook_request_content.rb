# frozen_string_literal: true

module Auth0
  module Hooks
    module Types
      class CreateHookRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :script, -> { String }, optional: false, nullable: false
        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :dependencies, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
        field :trigger_id, -> { Auth0::Types::HookTriggerIDEnum }, optional: false, nullable: false, api_name: "triggerId"
      end
    end
  end
end
