# frozen_string_literal: true

module Auth0
  module Types
    # The structure of the template, which can be used as the payload for creating or updating a User Attribute Profile.
    class UserAttributeProfileTemplate < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :user_id, -> { Auth0::Types::UserAttributeProfileUserID }, optional: true, nullable: false
      field :user_attributes, -> { Internal::Types::Hash[String, Auth0::Types::UserAttributeProfileUserAttributeAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
