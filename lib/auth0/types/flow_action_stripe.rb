# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripe < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionStripeAddTaxID }
      member -> { Auth0::Types::FlowActionStripeCreateCustomer }
      member -> { Auth0::Types::FlowActionStripeCreatePortalSession }
      member -> { Auth0::Types::FlowActionStripeDeleteTaxID }
      member -> { Auth0::Types::FlowActionStripeFindCustomers }
      member -> { Auth0::Types::FlowActionStripeGetCustomer }
      member -> { Auth0::Types::FlowActionStripeUpdateCustomer }
    end
  end
end
