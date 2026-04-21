# frozen_string_literal: true

module Auth0
  module Types
    class GetUserAttributeProfileResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :user_id, -> { Auth0::Types::UserAttributeProfileUserID }, optional: true, nullable: false
      field :user_attributes, -> { Internal::Types::Hash[String, Auth0::Types::UserAttributeProfileUserAttributeAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
