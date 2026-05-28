# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      module EffectiveRoles
        module Sources
          module Groups
            module Types
              class ListOrganizationMemberRoleSourceGroupsRequestParameters < Internal::Types::Model
                field :id, -> { String }, optional: false, nullable: false

                field :user_id, -> { String }, optional: false, nullable: false

                field :from, -> { String }, optional: true, nullable: false

                field :take, -> { Integer }, optional: true, nullable: false

                field :role_id, -> { String }, optional: false, nullable: false
              end
            end
          end
        end
      end
    end
  end
end
