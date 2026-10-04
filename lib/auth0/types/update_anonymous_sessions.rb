# frozen_string_literal: true

module Auth0
  module Types
    # Anonymous sessions configuration for this client.
    class UpdateAnonymousSessions < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
