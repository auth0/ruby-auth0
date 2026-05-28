# frozen_string_literal: true

module Auth0
  module Types
    class ListUserRoleSourceGroupsResponseContent < Internal::Types::Model
      field :groups, -> { Internal::Types::Array[Auth0::Types::Group] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
