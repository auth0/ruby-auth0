# frozen_string_literal: true

module Auth0
  module Types
    # Authentication signal details
    class SessionAuthenticationSignal < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :timestamp, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
    end
  end
end
