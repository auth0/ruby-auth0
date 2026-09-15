# frozen_string_literal: true

module Auth0
  module Types
    class SearchOrganizationsPaginatedResponseContent < Internal::Types::Model
      field :organizations, -> { Internal::Types::Array[Auth0::Types::SearchOrganization] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
