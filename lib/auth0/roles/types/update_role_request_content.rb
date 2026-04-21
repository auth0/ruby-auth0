# frozen_string_literal: true

module Auth0
  module Roles
    module Types
      class UpdateRoleRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
