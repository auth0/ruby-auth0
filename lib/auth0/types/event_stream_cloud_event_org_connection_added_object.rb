# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgConnectionAddedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganization }, optional: false, nullable: false
      field :connection, -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectConnection }, optional: false, nullable: false
      field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :is_signup_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
