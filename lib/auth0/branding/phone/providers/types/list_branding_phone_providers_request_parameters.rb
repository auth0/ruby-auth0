# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Providers
        module Types
          class ListBrandingPhoneProvidersRequestParameters < Internal::Types::Model
            field :disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
