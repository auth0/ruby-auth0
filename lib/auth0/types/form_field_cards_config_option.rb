# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldCardsConfigOption < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
      field :label, -> { String }, optional: false, nullable: false
      field :image_url, -> { String }, optional: false, nullable: false
    end
  end
end
