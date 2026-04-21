# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigChargeOneOff < Internal::Types::Model
      field :type, -> { Auth0::Types::FormFieldPaymentConfigChargeTypeOneOffConst }, optional: false, nullable: false
      field :one_off, -> { Auth0::Types::FormFieldPaymentConfigChargeOneOffOneOff }, optional: false, nullable: false
    end
  end
end
