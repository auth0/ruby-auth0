# frozen_string_literal: true

module Auth0
  module Types
    # Configure the connection to be used as a Requesting Application for Cross App Access.
    class CrossAppAccessRequestingApp < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
