# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'office365' connection
    class ConnectionOptionsOffice365 < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
    end
  end
end
