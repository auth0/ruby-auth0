# frozen_string_literal: true

module Auth0
  module Types
    # Connection Profile Strategy Override
    class ConnectionProfileStrategyOverride < Internal::Types::Model
      field :enabled_features, -> { Internal::Types::Array[Auth0::Types::EnabledFeaturesEnum] }, optional: true, nullable: false
      field :connection_config, -> { Auth0::Types::ConnectionProfileStrategyOverridesConnectionConfig }, optional: true, nullable: false
    end
  end
end
