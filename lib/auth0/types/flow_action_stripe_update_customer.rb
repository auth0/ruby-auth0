# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeUpdateCustomer < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionStripeUpdateCustomerType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionStripeUpdateCustomerAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionStripeUpdateCustomerParams }, optional: false, nullable: false
    end
  end
end
