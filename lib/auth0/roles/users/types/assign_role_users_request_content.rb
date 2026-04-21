# frozen_string_literal: true

module Auth0
  module Roles
    module Users
      module Types
        class AssignRoleUsersRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :users, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
