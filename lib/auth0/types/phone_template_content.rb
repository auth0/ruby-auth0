# frozen_string_literal: true

module Auth0
  module Types
    class PhoneTemplateContent < Internal::Types::Model
      field :syntax, -> { String }, optional: true, nullable: false
      field :from, -> { String }, optional: true, nullable: false
      field :body, -> { Auth0::Types::PhoneTemplateBody }, optional: true, nullable: false
    end
  end
end
