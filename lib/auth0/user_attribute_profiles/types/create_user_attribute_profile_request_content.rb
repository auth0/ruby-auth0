# frozen_string_literal: true

module Auth0
  module UserAttributeProfiles
    module Types
      class CreateUserAttributeProfileRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :user_id, -> { Auth0::Types::UserAttributeProfileUserID }, optional: true, nullable: false
        field :user_attributes, -> { Internal::Types::Hash[String, Auth0::Types::UserAttributeProfileUserAttributeAdditionalProperties] }, optional: false, nullable: false
      end
    end
  end
end
