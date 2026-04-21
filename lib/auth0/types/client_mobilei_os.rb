# frozen_string_literal: true

module Auth0
  module Types
    # iOS native app configuration.
    class ClientMobileiOs < Internal::Types::Model
      field :team_id, -> { String }, optional: true, nullable: false
      field :app_bundle_identifier, -> { String }, optional: true, nullable: false
    end
  end
end
