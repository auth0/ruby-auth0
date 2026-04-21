# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionTwilioAPIKey < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDTwilioEnum }, optional: false, nullable: false
      field :setup, -> { Auth0::Types::FlowsVaultConnectioSetupTwilioAPIKey }, optional: false, nullable: false
    end
  end
end
