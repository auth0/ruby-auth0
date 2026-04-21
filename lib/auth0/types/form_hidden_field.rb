# frozen_string_literal: true

module Auth0
  module Types
    class FormHiddenField < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
