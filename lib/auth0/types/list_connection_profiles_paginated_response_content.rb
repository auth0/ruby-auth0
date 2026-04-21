# frozen_string_literal: true

module Auth0
  module Types
    class ListConnectionProfilesPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :connection_profiles, -> { Internal::Types::Array[Auth0::Types::ConnectionProfile] }, optional: true, nullable: false
    end
  end
end
