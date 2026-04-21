# frozen_string_literal: true

module Auth0
  module Types
    class PartialPhoneTemplateContent < Internal::Types::Model
      field :from, -> { String }, optional: true, nullable: false
      field :body, -> { Auth0::Types::PhoneTemplateBody }, optional: true, nullable: false
    end
  end
end
