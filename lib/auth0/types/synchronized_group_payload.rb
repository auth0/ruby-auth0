# frozen_string_literal: true

module Auth0
  module Types
    class SynchronizedGroupPayload < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
