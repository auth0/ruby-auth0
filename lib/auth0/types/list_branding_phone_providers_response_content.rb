# frozen_string_literal: true

module Auth0
  module Types
    class ListBrandingPhoneProvidersResponseContent < Internal::Types::Model
      field :providers, -> { Internal::Types::Array[Auth0::Types::PhoneProviderSchemaMasked] }, optional: true, nullable: false
    end
  end
end
