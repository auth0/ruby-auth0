# frozen_string_literal: true

module Auth0
  module Types
    # Password complexity options
    class ConnectionPasswordComplexityOptions < Internal::Types::Model
      field :min_length, -> { Integer }, optional: true, nullable: false
    end
  end
end
