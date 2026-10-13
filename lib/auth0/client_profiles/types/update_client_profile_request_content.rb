# frozen_string_literal: true

module Auth0
  module ClientProfiles
    module Types
      class UpdateClientProfileRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :client_configuration, -> { Auth0::Types::ClientProfileClientConfiguration }, optional: true, nullable: false

        field :apply_policy, -> { Auth0::Types::ClientProfileApplyPolicy }, optional: true, nullable: false
      end
    end
  end
end
