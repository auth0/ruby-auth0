# frozen_string_literal: true

module Auth0
  module Actions
    module Types
      class CreateActionRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :supported_triggers, -> { Internal::Types::Array[Auth0::Types::ActionTrigger] }, optional: false, nullable: false
        field :code, -> { String }, optional: true, nullable: false
        field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionVersionDependency] }, optional: true, nullable: false
        field :runtime, -> { String }, optional: true, nullable: false
        field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionSecretRequest] }, optional: true, nullable: false
        field :modules, -> { Internal::Types::Array[Auth0::Types::ActionModuleReference] }, optional: true, nullable: false
        field :deploy, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
