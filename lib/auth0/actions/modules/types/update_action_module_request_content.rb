# frozen_string_literal: true

module Auth0
  module Actions
    module Modules
      module Types
        class UpdateActionModuleRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :code, -> { String }, optional: true, nullable: false
          field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionModuleSecretRequest] }, optional: true, nullable: false
          field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionModuleDependencyRequest] }, optional: true, nullable: false
        end
      end
    end
  end
end
