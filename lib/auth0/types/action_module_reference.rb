# frozen_string_literal: true

module Auth0
  module Types
    # Reference to a module and its version used by an action.
    class ActionModuleReference < Internal::Types::Model
      field :module_id, -> { String }, optional: true, nullable: false
      field :module_name, -> { String }, optional: true, nullable: false
      field :module_version_id, -> { String }, optional: true, nullable: false
      field :module_version_number, -> { Integer }, optional: true, nullable: false
    end
  end
end
