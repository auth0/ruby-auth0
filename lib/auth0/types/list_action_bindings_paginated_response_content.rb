# frozen_string_literal: true

module Auth0
  module Types
    class ListActionBindingsPaginatedResponseContent < Internal::Types::Model
      field :total, -> { Integer }, optional: true, nullable: false
      field :page, -> { Integer }, optional: true, nullable: false
      field :per_page, -> { Integer }, optional: true, nullable: false
      field :bindings, -> { Internal::Types::Array[Auth0::Types::ActionBinding] }, optional: true, nullable: false
    end
  end
end
