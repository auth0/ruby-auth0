# frozen_string_literal: true

module Auth0
  module Tickets
    module Types
      class VerifyEmailTicketRequestContent < Internal::Types::Model
        field :result_url, -> { String }, optional: true, nullable: false
        field :user_id, -> { String }, optional: false, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :organization_id, -> { String }, optional: true, nullable: false
        field :ttl_sec, -> { Integer }, optional: true, nullable: false
        field :include_email_in_redirect, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeEmailInRedirect"
        field :identity, -> { Auth0::Types::Identity }, optional: true, nullable: false
      end
    end
  end
end
