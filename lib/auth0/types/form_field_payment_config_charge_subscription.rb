# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigChargeSubscription < Internal::Types::Model
      field :type, -> { Auth0::Types::FormFieldPaymentConfigChargeTypeSubscriptionConst }, optional: false, nullable: false
      field :subscription, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
