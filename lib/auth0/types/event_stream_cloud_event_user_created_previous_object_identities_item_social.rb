# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for social identity providers.
    class EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemSocial < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false

      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemSocialUserID }, optional: false, nullable: false

      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemSocialProfileData }, optional: true, nullable: false, api_name: "profileData"

      field :provider, -> { Auth0::Types::EventStreamCloudEventUserCreatedPreviousObjectIdentitiesItemSocialProviderEnum }, optional: false, nullable: false

      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
