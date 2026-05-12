# frozen_string_literal: true

module Auth0
  module Types
    # Represents an event that occurs when a member is added to an organization.
    class EventStreamCloudEventOrgMemberRoleAssignedCloudEvent < Internal::Types::Model
      field :specversion, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedCloudEventTypeEnum }, optional: false, nullable: false
      field :source, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :time, -> { String }, optional: false, nullable: false
      field :data, -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssignedData }, optional: false, nullable: false
      field :a0tenant, -> { String }, optional: false, nullable: false
      field :a0stream, -> { String }, optional: false, nullable: false
      field :a0purpose, -> { Auth0::Types::EventStreamCloudEventA0PurposeEnum }, optional: true, nullable: false
    end
  end
end
