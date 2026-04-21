# frozen_string_literal: true

module Auth0
  module Types
    class ActionModuleSecret < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
