# frozen_string_literal: true

module Auth0
  module Types
    class ActionModuleDependencyRequest < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
