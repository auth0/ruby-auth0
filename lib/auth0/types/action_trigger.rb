# frozen_string_literal: true

module Auth0
  module Types
    class ActionTrigger < Internal::Types::Model
      field :id, -> { Auth0::Types::ActionTriggerTypeEnum }, optional: false, nullable: false
      field :version, -> { String }, optional: true, nullable: false
      field :status, -> { String }, optional: true, nullable: false
      field :runtimes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :default_runtime, -> { String }, optional: true, nullable: false
      field :compatible_triggers, -> { Internal::Types::Array[Auth0::Types::ActionTriggerCompatibleTrigger] }, optional: true, nullable: false
      field :binding_policy, -> { Auth0::Types::ActionBindingTypeEnum }, optional: true, nullable: false
    end
  end
end
