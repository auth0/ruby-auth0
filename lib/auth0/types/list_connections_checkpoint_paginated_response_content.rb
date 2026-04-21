# frozen_string_literal: true

module Auth0
  module Types
    class ListConnectionsCheckpointPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :connections, -> { Internal::Types::Array[Auth0::Types::ConnectionForList] }, optional: true, nullable: false
    end
  end
end
