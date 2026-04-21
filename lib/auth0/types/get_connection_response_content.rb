# frozen_string_literal: true

module Auth0
  module Types
    class GetConnectionResponseContent < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :strategy, -> { String }, optional: true, nullable: false
      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :authentication, -> { Auth0::Types::ConnectionAuthenticationPurpose }, optional: true, nullable: false
      field :connected_accounts, -> { Auth0::Types::ConnectionConnectedAccountsPurpose }, optional: true, nullable: false
    end
  end
end
