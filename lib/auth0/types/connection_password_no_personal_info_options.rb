# frozen_string_literal: true

module Auth0
  module Types
    # Options for personal info in passwords policy
    class ConnectionPasswordNoPersonalInfoOptions < Internal::Types::Model
      field :enable, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
