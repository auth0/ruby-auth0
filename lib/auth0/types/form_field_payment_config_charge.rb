# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigCharge < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FormFieldPaymentConfigChargeOneOff }
      member -> { Auth0::Types::FormFieldPaymentConfigChargeSubscription }
    end
  end
end
