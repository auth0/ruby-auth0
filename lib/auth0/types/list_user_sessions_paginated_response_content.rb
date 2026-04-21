# frozen_string_literal: true

module Auth0
  module Types
    class ListUserSessionsPaginatedResponseContent < Internal::Types::Model
      field :sessions, -> { Internal::Types::Array[Auth0::Types::SessionResponseContent] }, optional: true, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
