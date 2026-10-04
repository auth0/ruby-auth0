# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Types
        class CreateFeatureFlagRequestContent < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :parameters, -> { Internal::Types::Hash[String, Auth0::Types::FeatureFlagConfigParam] }, optional: false, nullable: false
        end
      end
    end
  end
end
