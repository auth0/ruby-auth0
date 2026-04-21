# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPasswordConfig < Internal::Types::Model
      field :hash_, -> { Auth0::Types::FormFieldPasswordConfigHashEnum }, optional: true, nullable: false, api_name: "hash"
      field :placeholder, -> { String }, optional: true, nullable: false
      field :min_length, -> { Integer }, optional: true, nullable: false
      field :max_length, -> { Integer }, optional: true, nullable: false
      field :complexity, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :nist, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :strength_meter, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
