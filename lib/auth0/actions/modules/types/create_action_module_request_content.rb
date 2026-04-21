# frozen_string_literal: true

module Auth0
  module Actions
    module Modules
      module Types
        class CreateActionModuleRequestContent < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :code, -> { String }, optional: false, nullable: false
          field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionModuleSecretRequest] }, optional: true, nullable: false
          field :dependencies, -> { Internal::Types::Array[Auth0::Types::ActionModuleDependencyRequest] }, optional: true, nullable: false
          field :api_version, -> { String }, optional: true, nullable: false
          field :publish, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
