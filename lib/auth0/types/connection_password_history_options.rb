# frozen_string_literal: true

module Auth0
  module Types
    # Options for password history policy
    class ConnectionPasswordHistoryOptions < Internal::Types::Model
      field :enable, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :size, -> { Integer }, optional: true, nullable: false
    end
  end
end
