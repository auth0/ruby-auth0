# frozen_string_literal: true

module Auth0
  module Types
    class UpdateUniversalLoginTemplateRequestContentTemplate < Internal::Types::Model
      field :template, -> { String }, optional: false, nullable: false
    end
  end
end
