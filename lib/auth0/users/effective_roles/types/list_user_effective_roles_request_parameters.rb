# frozen_string_literal: true

module Auth0
  module Users
    module EffectiveRoles
      module Types
        class ListUserEffectiveRolesRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :from, -> { String }, optional: true, nullable: false

          field :take, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
