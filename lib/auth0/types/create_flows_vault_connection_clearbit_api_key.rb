# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionClearbitAPIKey < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDClearbitEnum }, optional: false, nullable: false
      field :setup, -> { Auth0::Types::FlowsVaultConnectioSetupSecretAPIKey }, optional: false, nullable: false
    end
  end
end
