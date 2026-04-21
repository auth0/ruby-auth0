# frozen_string_literal: true

module Auth0
  module Types
    # AWS addon configuration.
    class ClientAddonAws < Internal::Types::Model
      field :principal, -> { String }, optional: true, nullable: false
      field :role, -> { String }, optional: true, nullable: false
      field :lifetime_in_seconds, -> { Integer }, optional: true, nullable: false
    end
  end
end
