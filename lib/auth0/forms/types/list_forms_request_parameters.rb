# frozen_string_literal: true

module Auth0
  module Forms
    module Types
      class ListFormsRequestParameters < Internal::Types::Model
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :hydrate, -> { Auth0::Types::FormsRequestParametersHydrateEnum }, optional: true, nullable: false
      end
    end
  end
end
