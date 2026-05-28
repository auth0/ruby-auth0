# frozen_string_literal: true

module Auth0
  module Roles
    module Groups
      module Types
        class DeleteRoleGroupsRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :groups, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
