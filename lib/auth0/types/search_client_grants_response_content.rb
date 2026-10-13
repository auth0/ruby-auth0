# frozen_string_literal: true

module Auth0
  module Types
    class SearchClientGrantsResponseContent < Internal::Types::Model
      field :client_grants, -> { Internal::Types::Array[Auth0::Types::ClientGrantResponseContent] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
