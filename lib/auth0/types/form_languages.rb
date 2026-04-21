# frozen_string_literal: true

module Auth0
  module Types
    class FormLanguages < Internal::Types::Model
      field :primary, -> { String }, optional: true, nullable: false
      field :default, -> { String }, optional: true, nullable: false
    end
  end
end
