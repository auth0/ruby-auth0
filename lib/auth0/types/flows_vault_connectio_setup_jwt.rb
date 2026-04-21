# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupJwt < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeJwtEnum }, optional: false, nullable: false
      field :algorithm, -> { Auth0::Types::FlowsVaultConnectioSetupJwtAlgorithmEnum }, optional: false, nullable: false
    end
  end
end
