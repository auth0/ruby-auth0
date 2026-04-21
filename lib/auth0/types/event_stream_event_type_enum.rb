# frozen_string_literal: true

module Auth0
  module Types
    module EventStreamEventTypeEnum
      extend Auth0::Internal::Types::Enum

      GROUP_CREATED = "group.created"
      GROUP_DELETED = "group.deleted"
      GROUP_MEMBER_ADDED = "group.member.added"
      GROUP_MEMBER_DELETED = "group.member.deleted"
      GROUP_ROLE_ASSIGNED = "group.role.assigned"
      GROUP_ROLE_DELETED = "group.role.deleted"
      GROUP_UPDATED = "group.updated"
      ORGANIZATION_CONNECTION_ADDED = "organization.connection.added"
      ORGANIZATION_CONNECTION_REMOVED = "organization.connection.removed"
      ORGANIZATION_CONNECTION_UPDATED = "organization.connection.updated"
      ORGANIZATION_CREATED = "organization.created"
      ORGANIZATION_DELETED = "organization.deleted"
      ORGANIZATION_GROUP_ROLE_ASSIGNED = "organization.group.role.assigned"
      ORGANIZATION_GROUP_ROLE_DELETED = "organization.group.role.deleted"
      ORGANIZATION_MEMBER_ADDED = "organization.member.added"
      ORGANIZATION_MEMBER_DELETED = "organization.member.deleted"
      ORGANIZATION_MEMBER_ROLE_ASSIGNED = "organization.member.role.assigned"
      ORGANIZATION_MEMBER_ROLE_DELETED = "organization.member.role.deleted"
      ORGANIZATION_UPDATED = "organization.updated"
      USER_CREATED = "user.created"
      USER_DELETED = "user.deleted"
      USER_UPDATED = "user.updated"
    end
  end
end
