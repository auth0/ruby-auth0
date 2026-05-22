# frozen_string_literal: true

module Auth0
  module Types
    # The OAuth Client requesting or presenting an access token.
    class EventStreamCloudEventContextClient < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
