# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for database identity providers.
    class EventStreamCloudEventUserUpdatedObjectIdentitiesItemDatabase < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false

      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemDatabaseUserID }, optional: false, nullable: false

      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemDatabaseProfileData }, optional: true, nullable: false, api_name: "profileData"

      field :provider, -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemDatabaseProviderEnum }, optional: false, nullable: false

      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
