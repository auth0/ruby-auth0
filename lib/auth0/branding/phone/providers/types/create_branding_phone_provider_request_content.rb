# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Providers
        module Types
          class CreateBrandingPhoneProviderRequestContent < Internal::Types::Model
            field :name, -> { Auth0::Types::PhoneProviderNameEnum }, optional: false, nullable: false
            field :disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :configuration, -> { Auth0::Types::PhoneProviderConfiguration }, optional: true, nullable: false
            field :credentials, -> { Auth0::Types::PhoneProviderCredentials }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
