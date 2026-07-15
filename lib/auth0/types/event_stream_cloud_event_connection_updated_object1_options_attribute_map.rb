# frozen_string_literal: true

module Auth0
  module Types
    # Mapping of claims received from the identity provider (IdP)
    class EventStreamCloudEventConnectionUpdatedObject1OptionsAttributeMap < Internal::Types::Model
      field :attributes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :userinfo_scope, -> { String }, optional: true, nullable: false

      field :mapping_mode, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject1OptionsAttributeMapMappingModeEnum }, optional: true, nullable: false
    end
  end
end
