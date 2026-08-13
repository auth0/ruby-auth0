# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=oauth2
    class UpdateConnectionRequestContentOAuth2 < Internal::Types::Model
      field :display_name, -> { String }, optional: true, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false

      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurpose }, optional: true, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsOAuth2 }, optional: true, nullable: false
    end
  end
end
