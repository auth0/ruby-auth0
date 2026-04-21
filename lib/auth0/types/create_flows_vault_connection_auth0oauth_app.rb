# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionAuth0OauthApp < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDAuth0Enum }, optional: false, nullable: false
      field :setup, -> { Auth0::Types::FlowsVaultConnectioSetupOauthApp }, optional: false, nullable: false
    end
  end
end
