# frozen_string_literal: true

module Auth0
  module Types
    class PhoneAttributeIdentifier < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :default_method, -> { Auth0::Types::DefaultMethodPhoneNumberIdentifierEnum }, optional: true, nullable: false
    end
  end
end
