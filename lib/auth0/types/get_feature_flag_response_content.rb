# frozen_string_literal: true

module Auth0
  module Types
    class GetFeatureFlagResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :type, -> { Auth0::Types::FeatureFlagTypeEnum }, optional: false, nullable: false

      field :status, -> { Auth0::Types::FeatureFlagStatusEnum }, optional: false, nullable: false

      field :parameters, -> { Internal::Types::Hash[String, Auth0::Types::FeatureFlagConfigParam] }, optional: true, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end
