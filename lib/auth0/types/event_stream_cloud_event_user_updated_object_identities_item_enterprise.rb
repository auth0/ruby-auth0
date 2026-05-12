# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for enterprise identity providers.
    class EventStreamCloudEventUserUpdatedObjectIdentitiesItemEnterprise < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false
      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemEnterpriseUserID }, optional: false, nullable: false
      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemEnterpriseProfileData }, optional: true, nullable: false, api_name: "profileData"
      field :provider, -> { Auth0::Types::EventStreamCloudEventUserUpdatedObjectIdentitiesItemEnterpriseProviderEnum }, optional: false, nullable: false
      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
