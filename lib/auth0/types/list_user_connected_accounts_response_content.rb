# frozen_string_literal: true

module Auth0
  module Types
    class ListUserConnectedAccountsResponseContent < Internal::Types::Model
      field :connected_accounts, -> { Internal::Types::Array[Auth0::Types::ConnectedAccount] }, optional: false, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
