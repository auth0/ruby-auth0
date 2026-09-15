# frozen_string_literal: true

module Auth0
  module Types
    class SearchResourceServersResponseContent < Internal::Types::Model
      field :resource_servers, -> { Internal::Types::Array[Auth0::Types::ResourceServerSearchResponse] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
