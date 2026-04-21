# frozen_string_literal: true

module Auth0
  module Types
    class ListClientGrantOrganizationsPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :organizations, -> { Internal::Types::Array[Auth0::Types::Organization] }, optional: true, nullable: false
    end
  end
end
