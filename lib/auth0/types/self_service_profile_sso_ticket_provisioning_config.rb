# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for the setup of Provisioning in the self-service flow.
    class SelfServiceProfileSSOTicketProvisioningConfig < Internal::Types::Model
      field :scopes, -> { Internal::Types::Array[Auth0::Types::SelfServiceProfileSSOTicketProvisioningScopeEnum] }, optional: true, nullable: false
      field :google_workspace, -> { Auth0::Types::SelfServiceProfileSSOTicketGoogleWorkspaceConfig }, optional: true, nullable: false
      field :token_lifetime, -> { Integer }, optional: true, nullable: false
    end
  end
end
