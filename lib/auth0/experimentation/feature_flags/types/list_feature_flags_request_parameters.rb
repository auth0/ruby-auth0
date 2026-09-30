# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Types
        class ListFeatureFlagsRequestParameters < Internal::Types::Model
          field :from, -> { String }, optional: true, nullable: false

          field :take, -> { Integer }, optional: true, nullable: false

          field :type, -> { Auth0::Types::FeatureFlagTypeEnum }, optional: true, nullable: false

          field :status, -> { Auth0::Types::FeatureFlagStatusEnum }, optional: true, nullable: false
        end
      end
    end
  end
end
