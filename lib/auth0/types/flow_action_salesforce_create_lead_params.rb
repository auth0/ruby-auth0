# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSalesforceCreateLeadParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :first_name, -> { String }, optional: true, nullable: false
      field :last_name, -> { String }, optional: false, nullable: false
      field :company, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :phone, -> { String }, optional: true, nullable: false
      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
