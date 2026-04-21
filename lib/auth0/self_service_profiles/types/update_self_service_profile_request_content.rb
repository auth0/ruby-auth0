# frozen_string_literal: true

module Auth0
  module SelfServiceProfiles
    module Types
      class UpdateSelfServiceProfileRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :branding, -> { Auth0::Types::SelfServiceProfileBrandingProperties }, optional: true, nullable: false
        field :allowed_strategies, -> { Internal::Types::Array[Auth0::Types::SelfServiceProfileAllowedStrategyEnum] }, optional: true, nullable: false
        field :user_attributes, -> { Internal::Types::Array[Auth0::Types::SelfServiceProfileUserAttribute] }, optional: true, nullable: false
        field :user_attribute_profile_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
