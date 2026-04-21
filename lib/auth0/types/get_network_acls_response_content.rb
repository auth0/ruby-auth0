# frozen_string_literal: true

module Auth0
  module Types
    class GetNetworkACLsResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :active, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :priority, -> { Integer }, optional: true, nullable: false
      field :rule, -> { Auth0::Types::NetworkACLRule }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
