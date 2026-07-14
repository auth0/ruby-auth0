# frozen_string_literal: true

module Auth0
  module Organizations
    module Roles
      module Members
        module Types
          class ListOrganizationRoleMembersRequestParameters < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false

            field :role_id, -> { String }, optional: false, nullable: false

            field :from, -> { String }, optional: true, nullable: false

            field :take, -> { Integer }, optional: true, nullable: false

            field :fields, -> { String }, optional: true, nullable: false

            field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
