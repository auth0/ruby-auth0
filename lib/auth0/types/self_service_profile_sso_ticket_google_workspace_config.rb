# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for Google Workspace Directory Sync during the self-service flow.
    class SelfServiceProfileSSOTicketGoogleWorkspaceConfig < Internal::Types::Model
      field :sync_users, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
