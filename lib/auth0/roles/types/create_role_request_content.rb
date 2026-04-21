# frozen_string_literal: true

module Auth0
  module Roles
    module Types
      class CreateRoleRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
