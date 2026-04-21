# frozen_string_literal: true

module Auth0
  module Types
    class ListTokenExchangeProfileResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :token_exchange_profiles, -> { Internal::Types::Array[Auth0::Types::TokenExchangeProfileResponseContent] }, optional: true, nullable: false
    end
  end
end
