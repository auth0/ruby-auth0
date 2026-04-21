# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      module Roles
        module Types
          class AssignOrganizationMemberRolesRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :user_id, -> { String }, optional: false, nullable: false
            field :roles, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
