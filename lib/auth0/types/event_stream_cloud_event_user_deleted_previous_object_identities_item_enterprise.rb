# frozen_string_literal: true

module Auth0
  module Types
    # The identity object for enterprise identity providers.
    class EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemEnterprise < Internal::Types::Model
      field :connection, -> { String }, optional: false, nullable: false

      field :user_id, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemEnterpriseUserID }, optional: false, nullable: false

      field :profile_data, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemEnterpriseProfileData }, optional: true, nullable: false, api_name: "profileData"

      field :provider, -> { Auth0::Types::EventStreamCloudEventUserDeletedPreviousObjectIdentitiesItemEnterpriseProviderEnum }, optional: false, nullable: false

      field :is_social, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSocial"
    end
  end
end
