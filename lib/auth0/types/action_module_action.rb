# frozen_string_literal: true

module Auth0
  module Types
    class ActionModuleAction < Internal::Types::Model
      field :action_id, -> { String }, optional: true, nullable: false
      field :action_name, -> { String }, optional: true, nullable: false
      field :module_version_id, -> { String }, optional: true, nullable: false
      field :module_version_number, -> { Integer }, optional: true, nullable: false
      field :supported_triggers, -> { Internal::Types::Array[Auth0::Types::ActionTrigger] }, optional: true, nullable: false
    end
  end
end
