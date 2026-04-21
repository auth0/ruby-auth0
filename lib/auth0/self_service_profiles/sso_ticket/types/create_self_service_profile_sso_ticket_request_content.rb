# frozen_string_literal: true

module Auth0
  module SelfServiceProfiles
    module SSOTicket
      module Types
        class CreateSelfServiceProfileSSOTicketRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :connection_id, -> { String }, optional: true, nullable: false
          field :connection_config, -> { Auth0::Types::SelfServiceProfileSSOTicketConnectionConfig }, optional: true, nullable: false
          field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :enabled_organizations, -> { Internal::Types::Array[Auth0::Types::SelfServiceProfileSSOTicketEnabledOrganization] }, optional: true, nullable: false
          field :ttl_sec, -> { Integer }, optional: true, nullable: false
          field :domain_aliases_config, -> { Auth0::Types::SelfServiceProfileSSOTicketDomainAliasesConfig }, optional: true, nullable: false
          field :provisioning_config, -> { Auth0::Types::SelfServiceProfileSSOTicketProvisioningConfig }, optional: true, nullable: false
          field :use_for_organization_discovery, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :enabled_features, -> { Auth0::Types::SelfServiceProfileSSOTicketEnabledFeatures }, optional: true, nullable: false
        end
      end
    end
  end
end
