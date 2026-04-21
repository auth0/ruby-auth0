# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Templates
        module Types
          class CreatePhoneTemplateRequestContent < Internal::Types::Model
            field :type, -> { Auth0::Types::PhoneTemplateNotificationTypeEnum }, optional: true, nullable: false
            field :disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :content, -> { Auth0::Types::PhoneTemplateContent }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
