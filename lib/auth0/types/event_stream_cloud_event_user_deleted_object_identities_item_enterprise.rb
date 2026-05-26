# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for enterprise identity providers.
    class EventStreamCloudEventUserDeletedObjectIdentitiesItemEnterprise < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false

      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemEnterpriseUserID }, optional: false, nullable: false

      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemEnterpriseProfileData }, optional: true, nullable: false, api_name: "profileData"

      field :provider, -> { Auth0::Types::EventStreamCloudEventUserDeletedObjectIdentitiesItemEnterpriseProviderEnum }, optional: false, nullable: false

      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
