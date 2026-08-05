# frozen_string_literal: true

module Auth0
  module Types
    class SynchronizedGroupPayload < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: false

      field :direct_members_count, -> { Integer }, optional: true, nullable: false
    end
  end
end
