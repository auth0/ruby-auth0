# frozen_string_literal: true

module Auth0
  module Types
    class CreateFlowsVaultConnectionTelegramUninitialized < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :app_id, -> { Auth0::Types::FlowsVaultConnectionAppIDTelegramEnum }, optional: false, nullable: false
    end
  end
end
