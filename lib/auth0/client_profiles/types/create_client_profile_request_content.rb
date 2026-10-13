# frozen_string_literal: true

module Auth0
  module ClientProfiles
    module Types
      class CreateClientProfileRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :client_configuration, -> { Auth0::Types::ClientProfileClientConfiguration }, optional: false, nullable: false

        field :apply_policy, -> { Auth0::Types::ClientProfileApplyPolicy }, optional: false, nullable: false
      end
    end
  end
end
