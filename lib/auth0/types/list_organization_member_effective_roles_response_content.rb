# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationMemberEffectiveRolesResponseContent < Internal::Types::Model
      field :roles, -> { Internal::Types::Array[Auth0::Types::OrganizationMemberEffectiveRole] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
