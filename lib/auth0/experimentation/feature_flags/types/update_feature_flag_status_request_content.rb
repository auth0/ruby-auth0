# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Types
        class UpdateFeatureFlagStatusRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :status, -> { Auth0::Types::FeatureFlagStatusEnum }, optional: false, nullable: false
        end
      end
    end
  end
end
