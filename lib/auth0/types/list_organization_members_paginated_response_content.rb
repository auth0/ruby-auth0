# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationMembersPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :members, -> { Internal::Types::Array[Auth0::Types::OrganizationMember] }, optional: true, nullable: false
    end
  end
end
