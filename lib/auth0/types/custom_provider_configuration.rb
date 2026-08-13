# frozen_string_literal: true

module Auth0
  module Types
    class CustomProviderConfiguration < Internal::Types::Model
      field :delivery_methods, -> { Internal::Types::Array[Auth0::Types::CustomProviderDeliveryMethodEnum] }, optional: false, nullable: false
    end
  end
end
