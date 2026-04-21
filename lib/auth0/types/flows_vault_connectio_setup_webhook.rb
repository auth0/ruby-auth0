# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupWebhook < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeWebhookEnum }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
