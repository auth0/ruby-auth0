# frozen_string_literal: true

module Auth0
  module Types
    class ListFeatureFlagsResponseContent < Internal::Types::Model
      field :feature_flags, -> { Internal::Types::Array[Auth0::Types::FeatureFlag] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end
