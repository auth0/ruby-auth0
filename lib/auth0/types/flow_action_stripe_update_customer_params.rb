# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionStripeUpdateCustomerParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :phone, -> { String }, optional: true, nullable: false
      field :tax_exempt, -> { String }, optional: true, nullable: false
      field :address, -> { Auth0::Types::FlowActionStripeAddress }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
