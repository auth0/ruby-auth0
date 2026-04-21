# frozen_string_literal: true

module Auth0
  module Types
    # Client details
    class SessionClientMetadata < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
    end
  end
end
