# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for passwordless identity providers.
    class EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemPasswordless < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false

      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemPasswordlessUserID }, optional: false, nullable: false

      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemPasswordlessProfileData }, optional: true, nullable: false, api_name: "profileData"

      field :provider, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemPasswordlessProviderEnum }, optional: false, nullable: false

      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
