# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeAddTaxIDParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :customer_id, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
