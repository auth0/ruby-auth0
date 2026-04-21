# frozen_string_literal: true

module Auth0
  module Types
    class DeleteUserIdentityResponseContentItem < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false
      field :user_id, -> { String }, optional: false, nullable: false
      field :provider, -> { String }, optional: false, nullable: false
      field :is_social, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isSocial"
      field :access_token, -> { String }, optional: true, nullable: false
      field :access_token_secret, -> { String }, optional: true, nullable: false
      field :refresh_token, -> { String }, optional: true, nullable: false
      field :profile_data, -> { Auth0::Types::UserProfileData }, optional: true, nullable: false, api_name: "profileData"
    end
  end
end
