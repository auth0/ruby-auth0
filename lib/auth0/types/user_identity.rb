# frozen_string_literal: true

module Auth0
  module Types
    class UserIdentity < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false
      field :user_id, -> { Auth0::Types::UserID }, optional: false, nullable: false
      field :provider, -> { String }, optional: false, nullable: false
      field :profile_data, -> { Auth0::Types::UserProfileData }, optional: true, nullable: false, api_name: "profileData"
      field :is_social, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isSocial"
      field :access_token, -> { String }, optional: true, nullable: false
      field :access_token_secret, -> { String }, optional: true, nullable: false
      field :refresh_token, -> { String }, optional: true, nullable: false
    end
  end
end
