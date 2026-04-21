# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeDeleteTaxIDParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :customer_id, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
