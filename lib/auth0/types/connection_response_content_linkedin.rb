# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=linkedin
    class ConnectionResponseContentLinkedin < Internal::Types::Model
      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false

      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurpose }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :strategy, -> { Auth0::Types::ConnectionResponseContentLinkedinStrategy }, optional: false, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsLinkedin }, optional: true, nullable: false
    end
  end
end
