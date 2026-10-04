# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Types
        class UpdateFeatureFlagRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :name, -> { String }, optional: true, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :parameters, -> { Internal::Types::Hash[String, Auth0::Types::FeatureFlagConfigParam] }, optional: true, nullable: false
        end
      end
    end
  end
end
