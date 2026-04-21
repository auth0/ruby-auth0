# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionHubspotUninitialized < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDHubspotEnum }, optional: false, nullable: false
    end
  end
end
