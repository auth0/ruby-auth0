# frozen_string_literal: true

module Auth0
  module Organizations
    module Roles
      module Groups
        module Types
          class ListOrganizationRoleGroupsRequestParameters < Internal::Types::Model
            field :organization_id, -> { String }, optional: false, nullable: false

            field :role_id, -> { String }, optional: false, nullable: false

            field :from, -> { String }, optional: true, nullable: false

            field :take, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
