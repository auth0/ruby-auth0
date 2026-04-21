# frozen_string_literal: true

module Auth0
  module Types
    class ActionModuleDependency < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :version, -> { String }, optional: true, nullable: false
    end
  end
end
