# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      module EffectiveRoles
        module Types
          class ListOrganizationMemberEffectiveRolesRequestParameters < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false

            field :user_id, -> { String }, optional: false, nullable: false

            field :from, -> { String }, optional: true, nullable: false

            field :take, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
