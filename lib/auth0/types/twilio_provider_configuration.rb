# frozen_string_literal: true

module Auth0
  module Types
    class TwilioProviderConfiguration < Internal::Types::Model
      field :default_from, -> { String }, optional: true, nullable: false
      field :mssid, -> { String }, optional: true, nullable: false
      field :sid, -> { String }, optional: false, nullable: false
      field :delivery_methods, -> { Internal::Types::Array[Auth0::Types::TwilioProviderDeliveryMethodEnum] }, optional: false, nullable: false
    end
  end
end
