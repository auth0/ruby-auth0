# frozen_string_literal: true

module Auth0
  module OrganizationTemplates
    module Types
      class UpdateOrganizationTemplateRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :is_default, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :organization_deletion_behavior, -> { Auth0::Types::OrganizationDeletionBehaviorEnum }, optional: true, nullable: false

        field :connection_deletion_behavior, -> { Auth0::Types::ConnectionDeletionBehaviorEnum }, optional: true, nullable: false

        field :enforce_permission_ceiling, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :enforce_self_assignment_restriction, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :connection_profile_id, -> { String }, optional: true, nullable: false

        field :user_attribute_profile_id, -> { String }, optional: true, nullable: false

        field :allowed_strategies, -> { Internal::Types::Array[Auth0::Types::OrganizationTemplateAllowedStrategyEnum] }, optional: true, nullable: false

        field :invitation_landing_client_id, -> { String }, optional: true, nullable: false

        field :admin_roles_assignment, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :use_for_organization_discovery, -> { Auth0::Types::OrganizationTemplateUseForOrganizationDiscovery }, optional: true, nullable: false

        field :role_visibility_policy, -> { Auth0::Types::OrganizationTemplateRoleVisibilityPolicy }, optional: true, nullable: false
      end
    end
  end
end
