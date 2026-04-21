# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeAddress < Internal::Types::Model
      field :line1, -> { String }, optional: true, nullable: false
      field :line2, -> { String }, optional: true, nullable: false
      field :postal_code, -> { String }, optional: true, nullable: false, api_name: "postalCode"
      field :city, -> { String }, optional: true, nullable: false
      field :state, -> { String }, optional: true, nullable: false
      field :country, -> { String }, optional: true, nullable: false
    end
  end
end
