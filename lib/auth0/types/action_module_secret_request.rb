# frozen_string_literal: true

module Auth0
  module Types
    class ActionModuleSecretRequest < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
