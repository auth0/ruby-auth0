# frozen_string_literal: true

module Auth0
  module Types
    class ListUserAttributeProfilesPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :user_attribute_profiles, -> { Internal::Types::Array[Auth0::Types::UserAttributeProfile] }, optional: true, nullable: false
    end
  end
end
