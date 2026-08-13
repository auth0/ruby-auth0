# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for linked clients in the OIN Express Configuration feature.
    class LinkedClientConfiguration < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false
    end
  end
end
