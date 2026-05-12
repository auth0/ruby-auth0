# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for passwordless identity providers.
    class EventStreamCloudEventUserCreatedObjectIdentitiesItemPasswordless < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false
      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemPasswordlessUserID }, optional: false, nullable: false
      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemPasswordlessProfileData }, optional: true, nullable: false, api_name: "profileData"
      field :provider, -> { Auth0::Types::EventStreamCloudEventUserCreatedObjectIdentitiesItemPasswordlessProviderEnum }, optional: false, nullable: false
      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
