# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=google-apps
    class ConnectionResponseContentGoogleApps < Internal::Types::Model
      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false

      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurpose }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :strategy, -> { Auth0::Types::ConnectionResponseContentGoogleAppsStrategy }, optional: false, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsGoogleApps }, optional: true, nullable: false

      field :provisioning_ticket_url, -> { String }, optional: true, nullable: false

      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
