# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionActivecampaignAPIKey < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDActivecampaignEnum }, optional: false, nullable: false
      field :setup, -> { Auth0::Types::FlowsVaultConnectioSetupAPIKeyWithBaseURL }, optional: false, nullable: false
    end
  end
end
