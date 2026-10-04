# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Variations
        module Types
          class UpdateVariationRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false

            field :vid, -> { String }, optional: false, nullable: false

            field :name, -> { String }, optional: true, nullable: false

            field :description, -> { String }, optional: true, nullable: false

            field :overrides, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
