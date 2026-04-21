# frozen_string_literal: true

module Auth0
  module Types
    class GetRefreshTokensPaginatedResponseContent < Internal::Types::Model
      field :refresh_tokens, -> { Internal::Types::Array[Auth0::Types::RefreshTokenResponseContent] }, optional: true, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
