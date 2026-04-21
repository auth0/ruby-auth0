# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionStripeUninitialized < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDStripeEnum }, optional: false, nullable: false
    end
  end
end
