# frozen_string_literal: true

module Auth0
  module Types
    class SynchronizedGroupSelectionID < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
