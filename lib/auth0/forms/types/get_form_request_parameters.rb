# frozen_string_literal: true

module Auth0
  module Forms
    module Types
      class GetFormRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :hydrate, -> { Auth0::Types::FormsRequestParametersHydrateEnum }, optional: true, nullable: false
      end
    end
  end
end
