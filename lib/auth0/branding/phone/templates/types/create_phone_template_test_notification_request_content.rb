# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Templates
        module Types
          class CreatePhoneTemplateTestNotificationRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :to, -> { String }, optional: false, nullable: false
            field :delivery_method, -> { Auth0::Types::PhoneProviderDeliveryMethodEnum }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
