# frozen_string_literal: true

module Auth0
  module Types
    class DeployActionResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :action_id, -> { String }, optional: true, nullable: false
      field :code, -> { String }, optional: true, nullable: false
      field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionVersionDependency] }, optional: true, nullable: false
      field :deployed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :runtime, -> { String }, optional: true, nullable: false
      field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionSecretResponse] }, optional: true, nullable: false
      field :status, -> { Auth0::Types::ActionVersionBuildStatusEnum }, optional: true, nullable: false
      field :number, -> { Integer }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Auth0::Types::ActionError] }, optional: true, nullable: false
      field :action, -> { Auth0::Types::ActionBase }, optional: true, nullable: false
      field :built_at, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :supported_triggers, -> { Internal::Types::Array[Auth0::Types::ActionTrigger] }, optional: true, nullable: false
      field :modules, -> { Internal::Types::Array[Auth0::Types::ActionModuleReference] }, optional: true, nullable: false
    end
  end
end
