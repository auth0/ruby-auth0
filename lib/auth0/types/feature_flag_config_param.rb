# frozen_string_literal: true

module Auth0
  module Types
    class FeatureFlagConfigParam < Internal::Types::Model
      field :type, -> { Auth0::Types::FeatureFlagConfigParamTypeEnum }, optional: false, nullable: false

      field :value, -> { Object }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
