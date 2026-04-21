# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionPipedriveToken < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDPipedriveEnum }, optional: false, nullable: false
      field :setup, -> { Auth0::Types::FlowsVaultConnectioSetupToken }, optional: false, nullable: false
    end
  end
end
