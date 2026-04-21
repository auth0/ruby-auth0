# frozen_string_literal: true

module Auth0
  module Tickets
    module Types
      class ChangePasswordTicketRequestContent < Internal::Types::Model
        field :result_url, -> { String }, optional: true, nullable: false
        field :user_id, -> { String }, optional: true, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :organization_id, -> { String }, optional: true, nullable: false
        field :connection_id, -> { String }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :ttl_sec, -> { Integer }, optional: true, nullable: false
        field :mark_email_as_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :include_email_in_redirect, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeEmailInRedirect"
        field :identity, -> { Auth0::Types::ChangePasswordTicketIdentity }, optional: true, nullable: false
      end
    end
  end
end
