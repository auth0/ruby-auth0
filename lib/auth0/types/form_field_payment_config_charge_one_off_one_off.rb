# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigChargeOneOffOneOff < Internal::Types::Model
      field :amount, -> { Auth0::Types::FormFieldPaymentConfigChargeOneOffOneOffAmount }, optional: false, nullable: false
      field :currency, -> { Auth0::Types::FormFieldPaymentConfigChargeOneOffCurrencyEnum }, optional: false, nullable: false
    end
  end
end
