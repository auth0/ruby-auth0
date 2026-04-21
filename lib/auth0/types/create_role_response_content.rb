# frozen_string_literal: true

module Auth0
  module Types
    class CreateRoleResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
