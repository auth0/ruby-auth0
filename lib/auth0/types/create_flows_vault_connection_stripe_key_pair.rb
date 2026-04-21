# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionStripeKeyPair < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDStripeEnum }, optional: false, nullable: false
      field :setup, -> { Auth0::Types::FlowsVaultConnectioSetupStripeKeyPair }, optional: false, nullable: false
    end
  end
end
