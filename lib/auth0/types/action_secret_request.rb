# frozen_string_literal: true

module Auth0
  module Types
    class ActionSecretRequest < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
