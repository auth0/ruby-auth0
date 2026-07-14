# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationRoleMembersResponseContent < Internal::Types::Model
      field :members, -> { Internal::Types::Array[Auth0::Types::RoleMember] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
