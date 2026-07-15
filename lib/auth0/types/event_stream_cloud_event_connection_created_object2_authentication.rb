# frozen_string_literal: true

module Auth0
  module Types
    # Configure the purpose of a connection to be used for authentication during login.
    class EventStreamCloudEventConnectionCreatedObject2Authentication < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
