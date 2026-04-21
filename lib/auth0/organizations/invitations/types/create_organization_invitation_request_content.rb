# frozen_string_literal: true

module Auth0
  module Organizations
    module Invitations
      module Types
        class CreateOrganizationInvitationRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :inviter, -> { Auth0::Types::OrganizationInvitationInviter }, optional: false, nullable: false
          field :invitee, -> { Auth0::Types::OrganizationInvitationInvitee }, optional: false, nullable: false
          field :client_id, -> { String }, optional: false, nullable: false
          field :connection_id, -> { String }, optional: true, nullable: false
          field :app_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
          field :user_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
          field :ttl_sec, -> { Integer }, optional: true, nullable: false
          field :roles, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :send_invitation_email, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
