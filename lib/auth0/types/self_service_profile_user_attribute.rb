# frozen_string_literal: true

module Auth0
  module Types
    class SelfServiceProfileUserAttribute < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :is_optional, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
