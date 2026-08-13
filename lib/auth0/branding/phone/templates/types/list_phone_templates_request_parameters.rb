# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Templates
        module Types
          class ListPhoneTemplatesRequestParameters < Internal::Types::Model
            field :disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
