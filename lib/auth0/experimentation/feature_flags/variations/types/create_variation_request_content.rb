# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Variations
        module Types
          class CreateVariationRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false

            field :name, -> { String }, optional: false, nullable: false

            field :description, -> { String }, optional: true, nullable: false

            field :overrides, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
