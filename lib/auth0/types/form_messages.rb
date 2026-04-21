# frozen_string_literal: true

module Auth0
  module Types
    class FormMessages < Internal::Types::Model
      field :errors, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :custom, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
