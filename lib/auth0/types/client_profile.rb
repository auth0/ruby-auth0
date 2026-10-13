# frozen_string_literal: true

module Auth0
  module Types
    class ClientProfile < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :client_configuration, -> { Auth0::Types::ClientProfileClientConfiguration }, optional: false, nullable: false

      field :apply_policy, -> { Auth0::Types::ClientProfileApplyPolicy }, optional: false, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
