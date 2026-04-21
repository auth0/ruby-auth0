# frozen_string_literal: true

module Auth0
  module Types
    # Configuration related to the My Organization Configuration for the client.
    class ClientMyOrganizationPostConfiguration < Internal::Types::Model
      field :connection_profile_id, -> { String }, optional: true, nullable: false
      field :user_attribute_profile_id, -> { String }, optional: true, nullable: false
      field :allowed_strategies, -> { Internal::Types::Array[Auth0::Types::ClientMyOrganizationConfigurationAllowedStrategiesEnum] }, optional: false, nullable: false
      field :connection_deletion_behavior, -> { Auth0::Types::ClientMyOrganizationDeletionBehaviorEnum }, optional: false, nullable: false
      field :invitation_landing_client_id, -> { String }, optional: true, nullable: false
      field :allowed_roles, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
