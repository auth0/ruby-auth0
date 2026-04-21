# frozen_string_literal: true

module Auth0
  module NetworkACLs
    module Types
      class CreateNetworkACLRequestContent < Internal::Types::Model
        field :description, -> { String }, optional: false, nullable: false
        field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :priority, -> { Integer }, optional: true, nullable: false
        field :rule, -> { Auth0::Types::NetworkACLRule }, optional: false, nullable: false
      end
    end
  end
end
