# frozen_string_literal: true

module Auth0
  module Types
    class CreateActionModuleResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :code, -> { String }, optional: true, nullable: false
      field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionModuleDependency] }, optional: true, nullable: false
      field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionModuleSecret] }, optional: true, nullable: false
      field :actions_using_module_total, -> { Integer }, optional: true, nullable: false
      field :all_changes_published, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :latest_version_number, -> { Integer }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :latest_version, -> { Auth0::Types::ActionModuleVersionReference }, optional: true, nullable: false
    end
  end
end
