# frozen_string_literal: true

module Auth0
  module Types
    class UpdateFlowsVaultConnectionResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :app_id, -> { String }, optional: false, nullable: false
      field :environment, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :account_name, -> { String }, optional: true, nullable: false
      field :ready, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false
      field :refreshed_at, -> { String }, optional: true, nullable: false
      field :fingerprint, -> { String }, optional: false, nullable: false
    end
  end
end
