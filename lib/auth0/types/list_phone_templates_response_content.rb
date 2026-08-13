# frozen_string_literal: true

module Auth0
  module Types
    class ListPhoneTemplatesResponseContent < Internal::Types::Model
      field :templates, -> { Internal::Types::Array[Auth0::Types::PhoneTemplate] }, optional: true, nullable: false
    end
  end
end
