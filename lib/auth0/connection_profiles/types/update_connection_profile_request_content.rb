# frozen_string_literal: true

module Auth0
  module ConnectionProfiles
    module Types
      class UpdateConnectionProfileRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :organization, -> { Auth0::Types::ConnectionProfileOrganization }, optional: true, nullable: false
        field :connection_name_prefix_template, -> { String }, optional: true, nullable: false
        field :enabled_features, -> { Internal::Types::Array[Auth0::Types::EnabledFeaturesEnum] }, optional: true, nullable: false
        field :connection_config, -> { Auth0::Types::ConnectionProfileConfig }, optional: true, nullable: false
        field :strategy_overrides, -> { Auth0::Types::ConnectionProfileStrategyOverrides }, optional: true, nullable: false
      end
    end
  end
end
