# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgMemberRoleDeletedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleDeletedObjectOrganization }, optional: false, nullable: false

      field :user, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleDeletedObjectUser }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleDeletedObjectRole }, optional: false, nullable: false
    end
  end
end
