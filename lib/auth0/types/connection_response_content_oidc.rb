# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=oidc
    class ConnectionResponseContentOidc < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :strategy, -> { Auth0::Types::ConnectionResponseContentOidcStrategy }, optional: false, nullable: false

      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false

      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurposeXaa }, optional: true, nullable: false

      field :cross_app_access_requesting_app, -> { Auth0::Types::CrossAppAccessRequestingApp }, optional: true, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsOidc }, optional: true, nullable: false

      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
