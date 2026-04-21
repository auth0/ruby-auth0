# frozen_string_literal: true

module Auth0
  module Types
    class GetConnectionEnabledClientsResponseContent < Internal::Types::Model
      field :clients, -> { Internal::Types::Array[Auth0::Types::ConnectionEnabledClient] }, optional: false, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
