# frozen_string_literal: true

module Auth0
  module Users
    module Roles
      module Types
        class AssignUserRolesRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :roles, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
