# frozen_string_literal: true

module Auth0
  module Types
    # The latest published version as a reference object. Omitted if no versions have been published.
    class ActionModuleVersionReference < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :version_number, -> { Integer }, optional: true, nullable: false
      field :code, -> { String }, optional: true, nullable: false
      field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionModuleDependency] }, optional: true, nullable: false
      field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionModuleSecret] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
