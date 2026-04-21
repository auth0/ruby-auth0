# frozen_string_literal: true

module Auth0
  module Types
    class ListRefreshTokensPaginatedResponseContent < Internal::Types::Model
      field :tokens, -> { Internal::Types::Array[Auth0::Types::RefreshTokenResponseContent] }, optional: true, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
