# frozen_string_literal: true

module Auth0
  module Groups
    module Roles
      module Types
        class DeleteGroupRolesRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :roles, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
