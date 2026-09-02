# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgConnectionAddedPreviousObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganization }, optional: false, nullable: false

      field :connection, -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectConnection }, optional: false, nullable: false

      field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :is_signup_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :is_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :organization_access_level, -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationAccessLevel }, optional: true, nullable: false
    end
  end
end
