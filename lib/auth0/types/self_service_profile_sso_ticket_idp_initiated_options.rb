# frozen_string_literal: true

module Auth0
  module Types
    # Allows IdP-initiated login
    class SelfServiceProfileSSOTicketIdpInitiatedOptions < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_protocol, -> { Auth0::Types::SelfServiceProfileSSOTicketIdpInitiatedClientProtocolEnum }, optional: true, nullable: false
      field :client_authorizequery, -> { String }, optional: true, nullable: false
    end
  end
end
