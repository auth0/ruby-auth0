# frozen_string_literal: true

module Auth0
  module Types
    # The JSON payload delivered in each SSE data line. The type field is injected from the SSE event field by the SDK.
    # Discriminated by type: an event type name for events, "error" for errors, and "offset-only" for cursor-only
    # heartbeats.
    class EventStreamSubscribeEventsResponseContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      discriminant :type

      member -> { Auth0::Types::EventStreamCloudEventGroupCreated }, key: "GROUP_CREATED"
      member -> { Auth0::Types::EventStreamCloudEventGroupDeleted }, key: "GROUP_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventGroupMemberAdded }, key: "GROUP_MEMBER_ADDED"
      member -> { Auth0::Types::EventStreamCloudEventGroupMemberDeleted }, key: "GROUP_MEMBER_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventGroupRoleAssigned }, key: "GROUP_ROLE_ASSIGNED"
      member -> { Auth0::Types::EventStreamCloudEventGroupRoleDeleted }, key: "GROUP_ROLE_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventGroupUpdated }, key: "GROUP_UPDATED"
      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAdded }, key: "ORGANIZATION_CONNECTION_ADDED"
      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionRemoved }, key: "ORGANIZATION_CONNECTION_REMOVED"
      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdated }, key: "ORGANIZATION_CONNECTION_UPDATED"
      member -> { Auth0::Types::EventStreamCloudEventOrgCreated }, key: "ORGANIZATION_CREATED"
      member -> { Auth0::Types::EventStreamCloudEventOrgDeleted }, key: "ORGANIZATION_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssigned }, key: "ORGANIZATION_GROUP_ROLE_ASSIGNED"
      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeleted }, key: "ORGANIZATION_GROUP_ROLE_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventOrgMemberAdded }, key: "ORGANIZATION_MEMBER_ADDED"
      member -> { Auth0::Types::EventStreamCloudEventOrgMemberDeleted }, key: "ORGANIZATION_MEMBER_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleAssigned }, key: "ORGANIZATION_MEMBER_ROLE_ASSIGNED"
      member -> { Auth0::Types::EventStreamCloudEventOrgMemberRoleDeleted }, key: "ORGANIZATION_MEMBER_ROLE_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventOrgUpdated }, key: "ORGANIZATION_UPDATED"
      member -> { Auth0::Types::EventStreamCloudEventUserCreated }, key: "USER_CREATED"
      member -> { Auth0::Types::EventStreamCloudEventUserDeleted }, key: "USER_DELETED"
      member -> { Auth0::Types::EventStreamCloudEventUserUpdated }, key: "USER_UPDATED"
      member -> { Auth0::Types::EventStreamCloudEventErrorMessage }, key: "ERROR"
      member -> { Auth0::Types::EventStreamCloudEventOffsetOnlyMessage }, key: "OFFSET_ONLY"
    end
  end
end
