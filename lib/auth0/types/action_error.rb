# frozen_string_literal: true

module Auth0
  module Types
    # Error is a generic error with a human readable id which should be easily referenced in support tickets.
    class ActionError < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :msg, -> { String }, optional: true, nullable: false
      field :url, -> { String }, optional: true, nullable: false
    end
  end
end
