# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupStripeKeyPair < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeKeyPairEnum }, optional: false, nullable: false
      field :private_key, -> { String }, optional: false, nullable: false
      field :public_key, -> { String }, optional: false, nullable: false
    end
  end
end
