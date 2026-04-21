# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for the setup of the connection’s domain_aliases in the self-service SSO flow.
    class SelfServiceProfileSSOTicketDomainAliasesConfig < Internal::Types::Model
      field :domain_verification, -> { Auth0::Types::SelfServiceProfileSSOTicketDomainVerificationEnum }, optional: false, nullable: false
      field :pending_domains, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
