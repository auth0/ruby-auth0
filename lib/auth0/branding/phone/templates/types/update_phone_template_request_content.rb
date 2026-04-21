# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Templates
        module Types
          class UpdatePhoneTemplateRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :content, -> { Auth0::Types::PartialPhoneTemplateContent }, optional: true, nullable: false
            field :disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
