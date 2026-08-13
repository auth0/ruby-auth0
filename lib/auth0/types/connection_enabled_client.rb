# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionEnabledClient < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false
    end
  end
end
