# frozen_string_literal: true

module Auth0
  module Types
    # Checkpoint paginated list of client profiles.
    class ListClientProfilesPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"

      field :client_profiles, -> { Internal::Types::Array[Auth0::Types::ClientProfile] }, optional: false, nullable: false
    end
  end
end
