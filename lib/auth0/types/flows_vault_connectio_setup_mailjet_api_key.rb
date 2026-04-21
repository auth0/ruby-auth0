# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupMailjetAPIKey < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeAPIKeyEnum }, optional: false, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false
      field :secret_key, -> { String }, optional: false, nullable: false
    end
  end
end
