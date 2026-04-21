# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigFields < Internal::Types::Model
      field :card_number, -> { Auth0::Types::FormFieldPaymentConfigFieldProperties }, optional: true, nullable: false
      field :expiration_date, -> { Auth0::Types::FormFieldPaymentConfigFieldProperties }, optional: true, nullable: false
      field :security_code, -> { Auth0::Types::FormFieldPaymentConfigFieldProperties }, optional: true, nullable: false
      field :trustmarks, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
