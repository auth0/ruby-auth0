# frozen_string_literal: true

module Auth0
  module Types
    # Information about security-related signals.
    class LogSecurityContext < Internal::Types::Model
      field :ja3, -> { String }, optional: true, nullable: false
      field :ja4, -> { String }, optional: true, nullable: false
    end
  end
end
