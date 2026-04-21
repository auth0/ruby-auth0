# frozen_string_literal: true

module Auth0
  module Types
    class ListClientConnectionsResponseContent < Internal::Types::Model
      field :connections, -> { Internal::Types::Array[Auth0::Types::ConnectionForList] }, optional: false, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
