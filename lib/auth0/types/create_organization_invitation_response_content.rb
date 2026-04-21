# frozen_string_literal: true

module Auth0
  module Types
    class CreateOrganizationInvitationResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :organization_id, -> { String }, optional: true, nullable: false
      field :inviter, -> { Auth0::Types::OrganizationInvitationInviter }, optional: true, nullable: false
      field :invitee, -> { Auth0::Types::OrganizationInvitationInvitee }, optional: true, nullable: false
      field :invitation_url, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
      field :app_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :user_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :roles, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :ticket_id, -> { String }, optional: true, nullable: false
    end
  end
end
