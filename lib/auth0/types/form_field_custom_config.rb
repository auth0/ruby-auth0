# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldCustomConfig < Internal::Types::Model
      field :schema, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :code, -> { String }, optional: false, nullable: false
      field :css, -> { String }, optional: true, nullable: false
      field :params, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
