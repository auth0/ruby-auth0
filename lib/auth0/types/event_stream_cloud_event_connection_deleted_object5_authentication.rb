# frozen_string_literal: true

module Auth0
  module Types
    # Configure the purpose of a connection to be used for authentication during login.
    class EventStreamCloudEventConnectionDeletedObject5Authentication < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
