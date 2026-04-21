# frozen_string_literal: true

module Auth0
  module Types
    class Action < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :supported_triggers, -> { Internal::Types::Array[Auth0::Types::ActionTrigger] }, optional: true, nullable: false
      field :all_changes_deployed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :code, -> { String }, optional: true, nullable: false
      field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionVersionDependency] }, optional: true, nullable: false
      field :runtime, -> { String }, optional: true, nullable: false
      field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionSecretResponse] }, optional: true, nullable: false
      field :deployed_version, -> { Auth0::Types::ActionDeployedVersion }, optional: true, nullable: false
      field :installed_integration_id, -> { String }, optional: true, nullable: false
      field :integration, -> { Auth0::Types::Integration }, optional: true, nullable: false
      field :status, -> { Auth0::Types::ActionBuildStatusEnum }, optional: true, nullable: false
      field :built_at, -> { String }, optional: true, nullable: false
      field :deploy, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :modules, -> { Internal::Types::Array[Auth0::Types::ActionModuleReference] }, optional: true, nullable: false
    end
  end
end
