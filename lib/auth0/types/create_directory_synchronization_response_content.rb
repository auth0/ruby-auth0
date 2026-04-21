# frozen_string_literal: true

module Auth0
  module Types
    class CreateDirectorySynchronizationResponseContent < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :synchronization_id, -> { String }, optional: false, nullable: false
      field :status, -> { String }, optional: false, nullable: false
    end
  end
end
