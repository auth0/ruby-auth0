# frozen_string_literal: true

module Auth0
  module Types
    class ListClientGrantPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :client_grants, -> { Internal::Types::Array[Auth0::Types::ClientGrantResponseContent] }, optional: true, nullable: false
    end
  end
end
