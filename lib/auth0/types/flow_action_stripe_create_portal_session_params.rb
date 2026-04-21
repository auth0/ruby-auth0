# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeCreatePortalSessionParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :customer_id, -> { String }, optional: false, nullable: false
      field :return_url, -> { String }, optional: true, nullable: false
    end
  end
end
